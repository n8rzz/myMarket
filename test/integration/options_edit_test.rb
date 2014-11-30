require 'test_helper'

class OptionsEditTest < ActionDispatch::IntegrationTest

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

  test "unsuccessful option edit" do
    log_in_as(@user)
    get edit_option_path(@option)
    patch option_path(@option), option: { ticker: "",
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
    assert_template 'options/edit'
  end #unsuccessful option edit

  test "successful option edit" do
    log_in_as(@user)
    get edit_option_path(@option)
    ticker = "BAC"
    contracts = 5
    patch option_path(@option), option: { ticker: ticker,
                                          side: "Buy",
                                          optiontype: "Call",
                                          contracts: contracts,
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
    assert_not flash.empty?
    assert_redirected_to @option
    @option.reload
    assert_equal @option.ticker, ticker
    assert_equal @option.contracts, contracts
  end #successful option edit

end
