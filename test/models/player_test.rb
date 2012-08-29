require 'minitest_helper'

describe Player do

  before do
    @player = create :player
  end

  it "must work" do
    puts Player.count
  end

  it "must still work" do
    puts Player.first.inspect
  end
end
