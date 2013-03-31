require "test_helper"

describe Session do
  before do
    @session = Session.new
  end

  it "must be valid" do
    @session.valid?.must_equal true
  end
end
