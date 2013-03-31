require "test_helper"

describe ItemsController do
  it "should get index" do
    skip "auth"
    get :index
    assert_response :success
  end

end
