require "minitest_helper"

describe ItemsController do
  it "should get index" do
    get :index
    assert_response :success
  end

end
