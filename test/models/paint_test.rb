
require 'minitest_helper'

describe Paint do

  before do
    @white = create :white_paint
    file = File.open("./test/sample_bp.json")
    @backpack = JSON.parse(file.read)
  end

  it "must find the paint" do
    Paint.count.must_equal 1
    # NOTE there are 2 white paints in the sample_bp.json
    @white.search(@backpack).must_equal 2
  end

end
