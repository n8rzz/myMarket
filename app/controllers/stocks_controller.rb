class StocksController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: :destroy

  def index
    @stocks = current_user.stocks.all
  end

  def show
    @stock = Stock.find(params[:id])
    @history = Stock.where(ticker: params[:ticker])
  end

  def new
    @stock = Stock.new
  end

  def create
    @stock = current_user.stocks.build(stock_params)
    if @stock.save
      flash[:success] = "Stock Added!"
      redirect_to @stock
    else
      render 'new'
    end
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def update
    @stock = Stock.find(params[:id])
    if @stock.update_attributes(stock_params)
      flash[:success] = "Stock Updated"
      redirect_to @stock
    else
      render 'edit'
    end
  end

  def destroy
    Stock.find(params[:id]).destroy
    flash[:success] = "Stock Deleted"
    redirect_to stocks_path
  end

  private

    def stock_params
      params.require(:stock).permit(:ticker, :shares, :entryprice, :entryfee, :exitprice, :exitfee, :entrydate, :exitdate)
    end

    def correct_user
      @stock = current_user.stocks.find_by(id: params[:id])
      redirect_to root_url if @stock.nil?
    end

end