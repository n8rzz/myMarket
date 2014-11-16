require 'test_helper'

class TransactionTest < ActiveSupport::TestCase

  def setup
    @user = users(:harry)
    @transaction = @user.transactions.build( ticker: "TSLA", shares: "100", entryprice: "207.33", fee: "9.99")
  end

  test "should be valid" do
    assert @transaction.valid?
  end #should be valid

  test "user id should be present" do
    @transaction.user_id = nil
    assert_not @transaction.valid?
  end # user id should be present

  test "ticker should be present" do
    @transaction.ticker = " "
    assert_not @transaction.valid?
  end #ticker should be present

  test "ticker should be at most 5 characters" do
    @transaction.ticker = "a" * 6
    assert_not @transaction.valid?
  end #ticker at most 5 chars

  test "order should be oldest first" do
    assert_equal Transaction.last, transactions(:most_recent)
  end #order oldest first
end
