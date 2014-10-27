require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  def setup
    @base_title = "myMarket"
  end 

 
    test "should get home page" do
      get :home
      assert_response :success
      assert_select "title", "#{@base_title}"
    end #get home page

    test "should get top10 page" do
      get :top10
      assert_response :success
      assert_select "title", "Top 10 | #{@base_title}"
    end #get top10 page

    test "should get calculators page" do
      get :calculators
      assert_response :success
      assert_select "title", "Calculators | #{@base_title}"
    end #get calculators page

 
    test "should get help page" do
      get :help
      assert_response :success
      assert_select "title", "Help | #{@base_title}"
    end #get help page

    test "should get about page" do
      get :about
      assert_response :success
      assert_select "title", "About | #{@base_title}"
    end #get about page


    test "should get dashboard page" do
      get :dashboard
      assert_response :success
      assert_select "title", "Dashboard | #{@base_title}"
    end #get dashboard page
end