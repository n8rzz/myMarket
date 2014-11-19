class Stock < ActiveRecord::Base
  belongs_to :user

  before_save :upcase_ticker
  default_scope -> { order('created_at ASC') }
  validates :ticker, presence: true, length: { maximum: 6 }
  validates :shares, presence: true
  validates :entryprice, presence: true
  validates :entryfee, presence: true

  private

  def upcase_ticker
    self.ticker = ticker.upcase
  end
end
