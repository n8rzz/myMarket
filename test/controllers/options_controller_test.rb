require 'test_helper'

class OptionsControllerTest < ActionController::TestCase

  def setup
    @user = users(:harry)
    @option = options(:one)
    @cat = {ticker: "CAT",
            side: "Buy",
            optiontype: "Call",
            contracts: "5",
            size: "100",
            expiration: "01/18/2015",
            strike: "90.00",
            entryprice: "1.88",
            entryfee: "13.74",
            exitprice: "nil",
            exitfee: "nil",
            entrydate: Time.zone.now,
            exitdate: "nil",
            user_id: "1" }
  end

  test "should get options index" do
    log_in_as(@user)
    get :index
    assert_response :success
    assert_not_nil assigns(:options)
    assert_select 'h3'
    assert_select '.btn-xs'
    assert_select 'th', 15
  end

  test "should get options new" do
    log_in_as(@user)
    get :new
    assert_response :success
  end

  test "should create option" do
    log_in_as(@user)
    assert_difference('Option.count') do
      post :create, option: @cat
    end
    assert_redirected_to option_path(assigns(:option))
  end

  test "should update option" do
    log_in_as(@user)
    patch :update, id: @option, option: @cat
    assert_redirected_to option_path(assigns(:option))
  end

  test "should redirect create option when not logged in" do
    assert_no_difference 'Option.count' do
      post :create, option: @option
      end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Option.count' do
      delete :destroy, id: @option
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy option for wrong user" do
    log_in_as(users(:gandolf))
    option = options(:one)
    assert_no_difference 'Option.count' do
      delete :destroy, id: option
    end
    assert_redirected_to root_url
  end

end