module Elasticsearch
  module API
    module Actions
      def bulk_index(params={})
        body = params[:body].map do |raw|
          {:index => {
              :_index => params[:index],
              :_type  => params[:type],
              :data   => raw
          }}
        end

        bulk(params.merge(:body => body))
      end
    end
  end
end
