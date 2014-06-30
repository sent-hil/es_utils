require_relative "../../../spec_helper"

describe "Elasticsearach#scroll" do
  after { client.indices.delete(:index => index_name) }

  it "monkey patches `Elasticsearach` to add `scroll` method" do
    events = []
    (1..100).to_a.each do |i|
      events << {:index => {
        :_index => "es_utils",
        :_type  => "document",
        :data   => {
          :number => i
        }
      }}
    end

    client.bulk(:body => events, :refresh => true)

    options = {
      :index       => index_name,
      :scroll      => "5m",
      :size        => 10,
      :body        => {:sort => "_id"}
    }

    output = []
    client.scroll_each options do |results|
      results.each do |result|
        output << result["_source"]["number"]
      end
    end

    expect((1..100).to_a).to eq(output.sort)
  end
end
