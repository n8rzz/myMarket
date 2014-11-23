require 'test_helper'

class OptionsControllerTest < ActionController::TestCase

  def setup
    @option = options(:one)
  end

  test "should get options index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:options)
  end

  test "should get options new" do
    get :new
    assert_response :success
  end

end