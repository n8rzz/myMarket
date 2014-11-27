class StocksController < ApplicationController
  before_action :logged_in_user

  def index
    @stocks = Stock.all
  end

  def show
    @stock = Stock.find(params[:id])
#    @history = current_user.stocks.find_by(ticker: @stock.ticker)
  end

  def new
    @stock = Stock.new
  end

  def create
    @stock = current_user.stocks.build(stock_params)
    @stock.ticker = params[:stock][:ticker].upcase
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
      params.require(:stock).permit(:ticker, :shares, :entryprice, :entryfee, :exitprice, :exitfee)
    end

end