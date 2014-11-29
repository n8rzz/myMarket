require 'test_helper'

class OptionTest < ActiveSupport::TestCase

  def setup
    @user = users(:harry)
    @option = @user.options.build(ticker: "BAC", side: "Buy", optiontype: "Call", contracts: "5", size: "100", expiration: "01/15/2015", strike: "16", entryprice: "0.25", entryfee: "13.74", exitprice: "", exitfee: "13.74", entrydate: Time.zone.now, exitdate: "")
  end

  test "option should be valid" do
    @option.ticker = " "
    assert_not @option.valid?
  end

  test "user id should be present" do
    @option.user_id = nil
    assert_not @option.valid?
  end

  test "option entry date should be present" do
    @option.entrydate = " "
    assert_not @option.valid?
  end
  test "option ticker should be present" do
    @option.ticker = " "
    assert_not @option.valid?
  end

#  test "option ticker should be saved upcase" do
#    @option.ticker = " bac"
#    assert_not @option.valid?
#  end

  test "option ticker should be at most 6 characters" do
    @option.ticker = "a" * 7
    assert_not @option.valid?
  end
  test "option side should be present" do
    @option.side = " "
    assert_not @option.valid?
  end
  test "option optiontype should be present" do
    @option.optiontype = " "
    assert_not @option.valid?
  end
  test "option contracts should be present" do
    @option.contracts = " "
    assert_not @option.valid?
  end
  test "option size should be present" do
    @option.size = " "
    assert_not @option.valid?
  end
  test "option entry price should be present" do
    @option.entryprice = " "
    assert_not @option.valid?
  end
  test "option entry fee should be present" do
    @option.entryfee = " "
    assert_not @option.valid?
  end

end
