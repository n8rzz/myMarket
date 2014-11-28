class Stock < ActiveRecord::Base
  belongs_to :user
  before_save { ticker.upcase! }
  default_scope -> { order('created_at ASC') }
  validates :user_id, :shares, :entryprice, :entryfee, :entrydate, presence: true
  validates :ticker, presence: true, length: { maximum: 6 }

  def current_price
    #https://github.com/tyrauber/stock_quote
  end

  def profit_loss_dollars
  end

  def profit_loss_percent
  end

  def days_held
  end

end
