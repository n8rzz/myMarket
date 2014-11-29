require 'test_helper'

class StocksNewTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:harry)
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

  test "should redirect create stock when not logged in" do
    get new_stock_path
    assert_no_difference 'Stock.count' do
      post stocks_path, stock: @baba
    end
    assert_redirected_to login_url
  end

end
