
require 'minitest_helper'

describe Crate do

  before do
    @crate_19 = create :crate_19
    file = File.open("./test/sample_bp.json")
    @backpack = JSON.parse(file.read)
  end

  it "must be valid" do
    Crate.count.must_equal 1
    # NOTE there are 2 crate 19s in the sample_bp.json
    @crate_19.search(@backpack).must_equal 2
  end

end
