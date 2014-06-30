module Elasticsearch
  module API
    module Actions
      [:index, :update, :delete].each do |action|
        define_method "bulk_#{action}" do |params={}|
          body = params[:body].map do |raw|
            {action => {
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
end
