require 'test_helper'

describe Crate do

  it "Crate#search" do
    crate_19 = Crate.new defindex: 5022, name: "crate19", float_value: 19.0
    file = File.open("./test/sample_bp.json")
    backpack = JSON.parse(file.read)
    # NOTE there are 2 crate 19s in the sample_bp.json
    crate_19.search(backpack).must_equal 2
  end

end
