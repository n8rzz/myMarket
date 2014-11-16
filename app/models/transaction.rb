class Transaction < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at ASC') }
  validates :user_id, presence: true
  validates :ticker, presence: true, length: { maximum: 5 }
end
