
require 'minitest_helper'

describe Hat do

  before do
    create :buds
  end

  it "must find the crate" do
    Hat.count.must_equal 1
  end

end
