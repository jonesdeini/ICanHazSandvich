require 'minitest_helper'

describe Player do

  before do
    @player = create :player
  end

  it "must retrive name and avatar" do
    @player.name.wont_be_nil
    @player.avatar.wont_be_nil
  end

end
