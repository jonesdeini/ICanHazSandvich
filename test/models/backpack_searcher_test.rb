require 'minitest_helper'

describe BackpackSearcher do

  before do
    @steam_id = "76561198015466913"
    create :crate_19
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
    BackpackSearcher.new @json, @steam_id
    Player.first.items.count.must_equal 1
    BackpackSearcher.new @json, @steam_id
    Player.first.items.count.must_equal 1
  end

  it "find crate and create a player" do
    Crate.count.must_equal 1
    Player.count.must_equal 0
    BackpackSearcher.new @json, @steam_id
    Player.count.must_equal 1
    Player.first.items.count.must_equal 1
  end

  it "must increment inventory count for multiple items in a bp" do
    BackpackSearcher.new @json, @steam_id
    Player.count.must_equal 1
    player = Player.first
    player.items.count.must_equal 1
    player.inventories.count.must_equal 1
    player.inventories.first.item_count.must_equal 2
  end

  it "must remove items no longer in inventory" do
    # we dont want the item created by the setup
    BaseItem.delete_all
    # TODO neither works, no errors just doesnt have items
    #p = create :player_with_s_f_knife_2 #, items: [create(:strange_festive_scatter)]
    p = create :player_with_s_f_knife
    p.items << create(:strange_festive_scatter)
    p.items.count.must_equal 2
    BackpackSearcher.new @json, p.steam_id
    p.items.count.must_equal 1
  end

  it "must remove player if they no longer have any items" do
    file = File.open("./test/empty_bp.json")
    empty_bp = JSON.parse(file.read)
    p = create :player_with_item
    Player.count.must_equal 1
    BackpackSearcher.new empty_bp, p.steam_id
    Player.count.must_equal 0
  end

  it "wont create players with no items" do
    file = File.open("./test/empty_bp.json")
    empty_bp = JSON.parse(file.read)
    BackpackSearcher.new empty_bp, @steam_id
    Player.count.must_equal 0
  end

end
