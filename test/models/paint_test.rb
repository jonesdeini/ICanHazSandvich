require 'test_helper'

describe Paint do

  it "Paint#search" do
    white = Paint.new defindex: 5039, name: "white_paint"
    file = File.open("./test/sample_bp.json")
    backpack = JSON.parse(file.read)
    # NOTE there are 2 white paints in the sample_bp.json
    white.search(backpack).must_equal 2
  end

end
