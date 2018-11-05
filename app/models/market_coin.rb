class MarketCoin < ActiveRecord::Base

  # informations
  validates :symbol, presence: true
  validates :name, presence: true
  validates :coin_name, presence: true
  validates :code, presence: true, uniqueness: true
  validates :full_name, presence: true

  # image
  validates :logo_url, presence: false

  # details
  validates :algorithm, presence: true
  validates :proof_type, presence: true

  # numbers
  validates :market_cap, presence: true, numericality: true
  validates :price, presence: true, numericality: true
  validates :day_open, presence: true, numericality: true
  validates :day_high, presence: true, numericality: true
  validates :day_low, presence: true, numericality: true
  validates :all_time_high, presence: true, numericality: true

  # things that could be useful
  validates :rank, presence: false

  # trackings
  has_many :user_market_coins
  has_many :watchlist_coins

  # channel users
  has_one :market_coin_stream

  # NOTE : this will be replaced by a way
  # more effective system later on
  scope :search, -> (query) do
    self.where('(full_name ILIKE ?) OR (symbol ILIKE ?) OR (coin_name ILIKE ?) OR (name ILIKE ?)', "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
  end

  scope :default_order, -> do
    order(market_cap: :desc).order(rank: :asc)
  end

  scope :top, -> { order(rank: :asc).limit(8) }
end
