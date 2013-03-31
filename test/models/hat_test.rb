require 'test_helper'

describe Hat do

  it "must find the crate" do
    buds = Hat.new defindex: 143, name: "buds"
    file = File.open("./test/sample_bp.json")
    backpack = JSON.parse(file.read)
    # NOTE there are 1 earbuds in the sample_bp.json
    buds.search(backpack).must_equal 1
  end

end
