
require 'minitest_helper'

describe StrangeItem do

  before do
    @sf_knife = create :strange_festive_knife
    file = File.open("./test/sample_bp.json")
    @backpack = JSON.parse(file.read)
  end

  it "must find the crate" do
    StrangeItem.count.must_equal 1
    # NOTE there are 1 strange festive knives in the sample_bp.json
    @sf_knife.search(@backpack).must_equal 1
  end

end
