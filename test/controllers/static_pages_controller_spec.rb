require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
    setup do |variable|
      @user = users(:one)
    end

    test "should render home view without a user" do
      get :home
      assert_response :success
    end

    test "should render the dashboard view with the angular template"
      sign_in @user
      get :dashboard
      assert_template :dashboard
      assert_template layout: "layouts/angular"
    end

    test "should redirect from dashboard view to home without a user"
      get :dashboard
      assert_response :redirect
    end

end