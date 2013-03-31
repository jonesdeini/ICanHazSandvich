require 'test_helper'

describe Player do

  before do
    @player = Player.new
    @player.steam_id = "76561198015466913"
  end

  it "must retrive name and avatar" do
    skip "le sigh"
    @player.name.wont_be_nil
    @player.avatar.wont_be_nil
  end

end
