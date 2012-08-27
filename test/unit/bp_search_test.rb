require 'minitest_helper'

describe BP_Search do

  before do
    #bp = 
    @steam_id = "76561198015466913"
    @s_f_knife = create :strange_festive_knife
  end

  it "must work" do
    puts BaseItem.count
  end
end
