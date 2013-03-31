require 'test_helper'

describe StrangeItem do

  it "StrangeItem#search" do
    sf_knife = StrangeItem.new defindex: 665, name: "strange_festive_knife", quality: 11
    file = File.open("./test/sample_bp.json")
    backpack = JSON.parse(file.read)
    # NOTE there are 1 strange festive knives in the sample_bp.json
    sf_knife.search(backpack).must_equal 1
  end

end
