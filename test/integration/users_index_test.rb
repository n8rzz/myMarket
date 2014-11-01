require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

	def setup
		@admin = users(:harry)
		@non_admmin = users(:gandolf)
	end

	  test "index as admin including pagination and delete links" do
	    log_in_as(@admin)
	    get users_path
	    assert_select 'div.pagination'
	    first_page_of_users = User.paginate(page: 1)
	    first_page_of_users.each do |user|
	      assert_select 'a', user.name
	    end
	    assert_select 'a', text: 'delete'
	    user = first_page_of_users.first
	    assert_difference 'User.count', -1 do
	      delete user_path(user)
	    end
	  end #index as admin including pagination delete links

	test "index as non-admin" do 
		log_in_as(@non_admmin)
		get users_path
		assert_select 'a', text: 'delete', count: 0
	end #index as non-admin
end
