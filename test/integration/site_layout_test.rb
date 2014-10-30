require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

	test "layout links" do
		get root_path
		assert_template 'static_pages/home'	
		assert_select "a[href=?]", root_path
		assert_select "a[href=?]", help_path, count: 2
		assert_select "a[href=?]", about_path
		#assert_select "a[href=?]", top10_path
		#assert_select "a[href=?]", calculators_path
		assert_select "a[href=?]", signup_path
		assert_select "a[href=?]", login_path
	end #layout links
 
end
