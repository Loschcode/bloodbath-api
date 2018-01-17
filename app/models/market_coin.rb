class MarketCoin < ActiveRecord::Base

  # informations
  validates :symbol, presence: true
  validates :name, presence: true
  validates :coin_name, presence: true
  validates :full_name, presence: true

  # image
  validates :logo_url, presence: false

  # details
  validates :algorithm, presence: true
  validates :proof_type, presence: true

  # numbers
  validates :market_cap, presence: true
  validates :price, presence: true
  validates :day_open, presence: true
  validates :day_high, presence: true
  validates :day_low, presence: true

  # things that could be useful
  validates :sort_order, presence: false

  # trackings
  has_many :coin_trackings

  # channel users
  has_one :market_coin_stream

  # NOTE : this will be replaced by a way
  # more effective system later on
  scope :search, -> (query) do
    self.where('(full_name ILIKE ?) OR (symbol ILIKE ?) OR (coin_name ILIKE ?) OR (name ILIKE ?)', "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
  end

end
