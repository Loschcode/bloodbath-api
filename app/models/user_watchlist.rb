class UserWatchlist < ActiveRecord::Base
  validates :user, presence: true
  belongs_to :user, touch: true

  has_many :watchlist_coins, dependent: :delete_all
  has_many :market_coins, through: :watchlist_coins
end
