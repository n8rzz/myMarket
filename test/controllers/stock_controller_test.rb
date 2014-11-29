require 'test_helper'

class StocksControllerTest < ActionController::TestCase

  def setup
    @user = users(:harry)
    @stock = stocks(:one)
  end

  test "should redirect create stock when not logged in" do
    assert_no_difference 'Stock.count' do
      post :create, stock: {ticker: "BABA",
                            shares: "5",
                            entryprice: "89.77",
                            entryfee: "9.99",
                            exitprice: "nil",
                            exitfee: "nil",
                            entrydate: Time.zone.now,
                            exitdate: " ",
                            user_id: "1"}
      end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Stock.count' do
      delete :destroy, id: @stock
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong stock" do
    log_in_as(users(:gandolf))
    stock = stocks(:one)
    assert_no_difference 'Stock.count' do
      delete :destroy, id: stock
    end
    assert_redirected_to root_url
  end

end