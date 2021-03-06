class OptionsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: :destroy

  def index
    @options = current_user.options.all
  end

  def show
    @option = Option.find(params[:id])
  end

  def new
    @option = Option.new
  end

  def create
    @option = current_user.options.build(option_params)
    if @option.save
      flash[:success] = "Option Added!"
      redirect_to @option
    else
      render 'new'
    end
  end

  def edit
    @option = Option.find(params[:id])
  end

  def update
    @option = Option.find(params[:id])
    if @option.update_attributes(option_params)
      flash[:success] = "Option Update"
      redirect_to @option
    else
      render 'edit'
    end
  end

  def destroy
    Option.find(params[:id]).destroy
    flash[:success] = "Option Deleted"
    redirect_to options_path
  end

  private

    def option_params
      params.require(:option).permit(:ticker, :side, :optiontype, :expiration, :contracts, :size, :strike, :entryprice, :entryfee, :exitprice, :exitfee, :entrydate, :exitdate)
    end

    def correct_user
      @option = current_user.options.find_by(id: params[:id])
      redirect_to root_url if @option.nil?
    end

end