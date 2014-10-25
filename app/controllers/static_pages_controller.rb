class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, except: [:home, :help]
  layout :chose_layout

  def home
  end

  def help
  end

  def dashboard
  end


  private

  	def choose_layout
  		user_signed_in? ? "angluar" : "application"
  	end
end
