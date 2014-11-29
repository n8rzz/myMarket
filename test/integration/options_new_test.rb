require 'test_helper'

class OptionsNewTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:harry)
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

  test "should redirect create option when not logged in" do
    get new_option_path
    assert_no_difference 'Option.count' do
      post options_path, option: @cat
    end
    assert_redirected_to login_url
  end

end
