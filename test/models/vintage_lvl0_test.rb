require 'test_helper'

describe VintageLvl do

  it "VintageLvl#search" do
    vintage_lvl0 = VintageLvl.new level: 0, name: "vintage_lvl0", quality: 3
    file = File.open("./test/vintage_lvl0_bp.json")
    backpack = JSON.parse(file.read)
    # NOTE there is one vintage lvl 0 item in lvl0_bp
    vintage_lvl0.search(backpack).must_equal 1
  end

end
