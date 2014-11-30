require 'test_helper'

class StockTest < ActiveSupport::TestCase

  def setup
    @user = users(:harry)
    @stock = @user.stocks.build(ticker: "HAL", shares: "100", entryprice: "53.66", entryfee: "9.99", exitprice: "", exitfee: "", entrydate: Time.zone.now, exitdate: "")
  end

  test "stock should be vaild" do
    assert @stock.valid?
  end

  test "user id should be present" do
    @stock.user_id = nil
    assert_not @stock.valid?
  end

  test "stock ticker should be present" do
    @stock.ticker = " "
    assert_not @stock.valid?
  end

  test "stock ticker should be at most 6 characters" do
    @stock.ticker = "a" * 7
    assert_not @stock.valid?
  end

#  test "stock ticker should be saved upcase" do
#    @stock.ticker = "hal"
#    assert_not @stock.valid?
#  end

  test "stock shares should be present" do
    @stock.shares = " "
    assert_not @stock.valid?
  end

  test "stock entry price should be present" do
    @stock.entryprice = " "
    assert_not @stock.valid?
  end
  test "stock entry price should be greater than 0.0001" do
    @stock.entryprice = -1
    assert_not @stock.valid?
    @stock.entryprice = 0
    assert_not @stock.valid?
    @stock.entryprice = 0.0001
    assert @stock.valid?
  end

  test "stock entry fee should be present" do
    @stock.entryfee = " "
    assert_not @stock.valid?
  end
  test "stock entry fee should be greater than 0.01" do
    @stock.entryfee = -1
    assert_not @stock.valid?
    @stock.entryfee = 0
    assert_not @stock.valid?
    @stock.entryfee = 0.01
    assert @stock.valid?
  end

  test "stock entry date should be present" do
    @stock.entrydate = " "
    assert_not @stock.valid?
  end

end
