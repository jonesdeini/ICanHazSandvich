
require 'minitest_helper'

describe VintageLvl do

  before do
    @vintage_lvl0 = create :vintage_lvl0
    file = File.open("./test/vintage_lvl0_bp.json")
    @backpack = JSON.parse(file.read)
  end

  it "must be valid" do
    VintageLvl.count.must_equal 1
    # NOTE there is one vintage lvl 0 item in lvl0_bp
    @vintage_lvl0.search(@backpack).must_equal 1
  end

end
