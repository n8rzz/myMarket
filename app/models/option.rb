class Option < ActiveRecord::Base
  belongs_to :user

  validates :ticker, presence: true, length: { maximum: 6 }
  validates :side, presence: true
  validates :optiontype, presence: true
  validates :contracts, presence: true
  validates :size, presence: true
  validates :entryprice, presence: true
  validates :entryfee, presence: true

end
