require_relative "../../../spec_helper"

describe "Elasticsearach#bulk_index" do
  after { client.indices.delete(:index => index_name) }

  it "monkey patches `Elasticsearach` to add `bulk_index`" do
    documents = [
      {a: 1}, {a: 2}, {a: 3}
    ]
    client.bulk_index(:index => index_name, :type => "doc", :refresh => true, :body => documents)

    raw = client.search(:index => index_name, :type => "doc")
    result = raw["hits"]["hits"]

    index  = result.map {|x| x["_index"]}.uniq[0]
    type   = result.map {|x| x["_type"]}.uniq[0]

    expect(index).to eq(index_name)
    expect(type).to eq("doc")
    expect(result.count).to eq(3)
  end
end
