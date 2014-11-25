class Stock < ActiveRecord::Base
  belongs_to :user
  before_save { ticker.upcase! }
  default_scope -> { order('created_at ASC') }
  validates :user_id, :shares, :entryprice, :entryfee, presence: true
  validates :ticker, presence: true, length: { maximum: 6 }

end
