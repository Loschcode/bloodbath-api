class MarketCoin < ActiveRecord::Base

  # informations
  validates :symbol, presence: true
  validates :name, presence: true
  validates :coin_name, presence: true
  validates :full_name, presence: true

  # details
  validates :algorithm, presence: true
  validates :proof_type, presence: true

  # numbers
  validates :market_cap, presence: true
  validates :price, presence: true
  validates :day_open, presence: true
  validates :day_high, presence: true
  validates :day_low, presence: true

  # trackings
  has_many :coin_trackings

  # channel users
  has_one :market_coin_stream
end
