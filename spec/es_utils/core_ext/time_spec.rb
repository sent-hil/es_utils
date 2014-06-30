require_relative "../../spec_helper"

describe "Time#kibana" do
  it "monkey patches `Time` to add `kibana` method" do
    expect(Time.parse("2014.06.29").kibana).to eq("2014-06-29T00:00:00-07:00")
  end
end
