require 'minitest_helper'

describe BackpackSearcher do

  before do
    @steam_id = "76561198015466913"
    create :strange_festive_knife
    file = File.open("./test/sample_bp.json")
    @json = JSON.parse(file.read)
  end

  it "find the item and create a player" do
    BaseItem.count.must_equal 1
    Player.count.must_equal 0
    BackpackSearcher.new @json, @steam_id
    Player.count.must_equal 1
    Player.first.items.count.must_equal 1
  end

  it "must create inventories for every item" do
    Player.count.must_equal 0
    create :strange_festive_wrench
    BackpackSearcher.new @json, @steam_id
    Player.first.items.count.must_equal 2
  end

  it "wont recreate inventories that already exist" do
    create :strange_festive_wrench
    BackpackSearcher.new @json, @steam_id
    Player.first.items.count.must_equal 2
    BackpackSearcher.new @json, @steam_id
    Player.first.items.count.must_equal 2
  end

end
