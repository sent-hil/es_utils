require "pry"

module Elasticsearch
  module API
    module Actions
      def scroll_each(arguments={}, &blk)
        valid_params = [
          :index, :scroll, :size, :body
        ]

        params = Utils.__validate_and_extract_params arguments, valid_params

        params[:body]   ||= {}
        params[:scroll] ||= "5m"
        params[:size]   ||= 100

        s = search({
          index:       params[:index],
          scroll:      params[:scroll],
          size:        params[:size],
          body:        {sort: '_id'}.merge(params[:body]),
          search_type: "scan",
        })

        loop do
          s = scroll(:scroll_id => s["_scroll_id"], :scroll => params[:scroll])
          results = s["hits"]["hits"]

          break  if results.empty?

          blk.call(results)
        end
      end
    end
  end
end
