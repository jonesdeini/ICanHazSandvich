require 'minitest_helper'

describe BackpackSearcher do

  before do
    @steam_id = "76561198015466913"
    @s_f_knife = create :strange_festive_knife
    file = File.open("./test/sample_bp.json")
    @json = JSON.parse(file.read)
  end

  it "find the item and create a player" do
    BaseItem.count.must_equal 1
    Player.count.must_equal 0
    BackpackSearcher.new @json, @steam_id
    Player.count.must_equal 1
  end

  it "must create inventories for every item" do
    # stuff
    it "must not recreate inventories that already exist" do
      # stufff
    end
  end

end
