require_relative "../lib/es_utils"

def client
  @client ||= Elasticsearch::Client.new
end

def index_name
  "es_utils"
end

require "pry"
