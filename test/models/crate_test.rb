
require 'minitest_helper'

describe BackpackSearcher do

  before do
    create :crate_19
  end

  it "must be valid" do
    Crate.count.must_equal 1
  end

end