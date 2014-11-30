require 'test_helper'

class StocksEditTest < ActionDispatch::IntegrationTest

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

  test "unsuccessful stock edit" do
    log_in_as(@user)
    get edit_stock_path(@stock)
    patch stock_path(@stock), stock: {ticker: "",
                                      shares: "5",
                                      entryprice: "89.77",
                                      entryfee: "9.99",
                                      exitprice: "nil",
                                      exitfee: "nil",
                                      entrydate: Time.zone.now,
                                      exitdate: " ",
                                      user_id: "1"}
    assert_template 'stocks/edit'
  end #unsuccessful stock edit

  test "successful stock edit" do
    log_in_as(@user)
    get edit_stock_path(@stock)
    ticker = "BABA"
    shares = 10
    patch stock_path(@stock), stock: {ticker: ticker,
                                      shares: shares,
                                      entryprice: "89.77",
                                      entryfee: "9.99",
                                      exitprice: "nil",
                                      exitfee: "nil",
                                      entrydate: Time.zone.now,
                                      exitdate: " ",
                                      user_id: "1"}
    assert_not flash.empty?
    assert_redirected_to @stock
    @stock.reload
    assert_equal @stock.ticker, ticker
    assert_equal @stock.shares, shares
  end #successful edit

end
