
require 'minitest_helper'

describe Hat do

  before do
    @buds = create :buds
    file = File.open("./test/sample_bp.json")
    @backpack = JSON.parse(file.read)
  end

  it "must find the crate" do
    Hat.count.must_equal 1
    # NOTE there are 1 earbuds in the sample_bp.json
    @buds.search(@backpack).must_equal 1
  end

end
