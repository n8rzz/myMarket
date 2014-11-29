class Option < ActiveRecord::Base
  belongs_to :user

  before_save { self.ticker = ticker.upcase }

  validates :user_id, :side, :optiontype, :entrydate, presence: true
  validates :contracts, :size, presence: true, numericality: {greater_than_or_equal_to: 1.0}
  validates :entryfee, presence: true, numericality: {greater_than_or_equal_to: 0.01}
  validates :entryprice, presence: true, numericality: {greater_than_or_equal_to: 0.0001}
  validates :ticker, presence: true, length: { maximum: 6 }

end
