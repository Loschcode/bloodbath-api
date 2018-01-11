class CurrencyState < ActiveRecord::Base

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

  has_many :currency_trackings
end
