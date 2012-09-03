require 'minitest_helper'

describe Player do

  before do
    @player = create :player
  end

  it "must retrive name and avatar" do
    @player.name.wont_be_nil
    @player.avatar.wont_be_nil
  end

  it "must be valid" do
    Player.delete_all
    create :player_with_item
    Player.first.items.count.must_equal 1
  end

end
