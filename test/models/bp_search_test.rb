require 'minitest_helper'

describe BP_Search do

  before do
    @steam_id = "76561198015466913"
    @s_f_knife = create :strange_festive_knife
  end

  it "must work" do
    skip ("hey bro")
    @s_f_knife.inventories.wont_be_nil
  end

end
