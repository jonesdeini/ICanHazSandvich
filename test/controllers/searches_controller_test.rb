require "test_helper"

describe SearchesController do
  it "should get index" do
    skip "auth"
    get :index
    assert_response :success
  end

end
