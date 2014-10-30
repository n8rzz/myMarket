require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:harry)
	end

	test "layout links" do
		get root_path
		assert_template 'static_pages/home'	
		assert_select "a[href=?]", root_path
		assert_select "a[href=?]", help_path
		assert_select "a[href=?]", about_path
		assert_select "a[href=?]", signup_path
		assert_select "a[href=?]", login_path
	end #layout links
 
	test "layout links after successful login" do 
		get login_path
		post login_path, session: { email: @user.email, password: 'password' }
		assert is_logged_in?
		assert_redirected_to @user
		follow_redirect!
		assert_template 'users/show'
		assert_select "a[href=?]", calculators_path
		##dashboard
		##transactions
		##settings

	end #layout links after successful login

end
