class Option < ActiveRecord::Base
  belongs_to :user

  before_save { self.ticker = ticker.upcase }

  validates :user_id, :side, :optiontype, :contracts, :size, :entryprice, :entryfee, :entrydate, presence: true
  validates :ticker, presence: true, length: { maximum: 6 }

end
