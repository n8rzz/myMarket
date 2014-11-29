require 'test_helper'

class StocksControllerTest < ActionController::TestCase

  def setup
    @user = users(:harry)
    @stock = stocks(:one)
    @baba = { ticker: "BABA",
              shares: "5",
              entryprice: "89.77",
              entryfee: "9.99",
              exitprice: "nil",
              exitfee: "nil",
              entrydate: Time.zone.now,
              exitdate: " ",
              user_id: "1"}
  end

  test "should get stock index" do
    log_in_as(@user)
    get :index
    assert_response :success
    assert_not_nil assigns(:stocks)
    assert_select 'h3'
    assert_select '.btn-xs'
    assert_select 'th', 13
  end

  test "should get stock new" do
    log_in_as(@user)
    get :new
    assert_response :success
  end

  test "should create stock" do
    log_in_as(@user)
    assert_difference('Stock.count') do
      post :create, stock: @baba
    end
    assert_redirected_to stock_path(assigns(:stock))
  end

  test "should update stock" do
    log_in_as(@user)
    patch :update, id: @stock, stock: @baba
    assert_redirected_to stock_path(assigns(:stock))
  end


  test "should redirect create stock when not logged in" do
    assert_no_difference 'Stock.count' do
      post :create, stock: @baba
      end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Stock.count' do
      delete :destroy, id: @stock
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy stock for wrong user" do
    log_in_as(users(:gandolf))
    stock = stocks(:one)
    assert_no_difference 'Stock.count' do
      delete :destroy, id: @stock
    end
    assert_redirected_to root_url
  end

end