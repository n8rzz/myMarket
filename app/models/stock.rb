class Stock < ActiveRecord::Base
  belongs_to :user

  before_save { ticker.upcase! }
  default_scope -> { order('created_at ASC') }
  validates :ticker, presence: true, length: { maximum: 6 }
  validates :shares, presence: true
  validates :entryprice, presence: true
  validates :entryfee, presence: true

end
