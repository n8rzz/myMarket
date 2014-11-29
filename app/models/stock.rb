class Stock < ActiveRecord::Base
  belongs_to :user

  before_save { self.ticker = ticker.upcase }

  default_scope -> { order('created_at ASC') }
  validates :user_id, presence: true
  validates :shares, presence: true, numericality: {greater_than_or_equal_to: 1.0}
  validates :entryprice, :entryfee, presence: true, numericality: {greater_than_or_equal_to: 0.0001}
  validates :entrydate, presence: true
  validates :ticker, presence: true, length: { maximum: 6 }

  def gross_liquidity
    (shares * entryprice)
  end

  def net_liquidity
    if exitfee?
      gross_liquidity - (entryfee + exitfee)
    else
      gross_liquidity - (entryfee * 2)
    end
  end

  def current_price
    #https://github.com/tyrauber/stock_quote
  end

  def profit_loss_dollars
  end

  def profit_loss_percent
  end

end
