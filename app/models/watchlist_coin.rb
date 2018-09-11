class WatchlistCoin < ActiveRecord::Base
  validates :user_watchlist, presence: true
  belongs_to :user_watchlist, touch: true

  validates :market_coin, presence: true
  belongs_to :market_coin

  has_one :user, through: :user_watchlist
end
