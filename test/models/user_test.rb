require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		@user = User.new(name: "Example User", email: "user@example.com",
			password: "foobar", password_confirmation: "foobar")
	end

	test "should be vaild" do
		assert @user.valid?
	end #should be vaild

	test "name should be present" do
		@user.name = "     "
		assert_not @user.valid?
	end #name should be present

	test "email should be present" do
		@user.email = "     "
		assert_not @user.valid?
	end #email should be present

	test "name should not be too long" do
		@user.name = "a" * 51
		assert_not @user.valid?
	end #name should not be too long

	test "emails should not be too long" do
		@user.email = "a" * 256
		assert_not @user.valid?
	end #email should not be too long

	test "email validation should accept valid addresses" do
	  valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
	                       first.last@foo.jp alice+bob@baz.cn]
	  valid_addresses.each do |valid_address|
	    @user.email = valid_address
	    assert @user.valid?, "#{valid_address.inspect} should be valid"
	  end
	end #email validation should accept validation addresses

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end #email validation should reject invalid addresses

  test "email addresses should be unique" do
  	duplicate_user = @user.dup
  	duplicate_user.email = @user.email.upcase
  	@user.save
  	assert_not duplicate_user.valid?
  end #email addresses should be unique

  test "email addresses should be saved as lower-case" do
  	mixed_case_email = "Foo@ExAMPle.CoM"
  	@user.email = mixed_case_email
  	@user.save
  	assert_equal mixed_case_email.downcase, @user.reload.email
  end #email should ne save as lower case

  test "password should have a minimum length" do
  	@user.password = @user.password_confirmation = "a" * 5
  	assert_not @user.valid?
  end #password should have minimum length

  test "authenticated? should return false for a user with nil digest" do
  	assert_not @user.authenticated?('')
  end #authenticated return false nil digest

  test "associated transactions should be destroyed" do
    @user.save
    @user.transactions.create!(ticker: "TSLA", shares: "100", entryprice: "207.33", fee: "9.99")
    assert_difference 'Transaction.count', -1 do
      @user.destroy
    end
  end #destroy user's transactions

end #usertest
