require 'test_helper'

class StocksControllerTest < ActionController::TestCase

  test "should get stocks index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stocks)
  end

end