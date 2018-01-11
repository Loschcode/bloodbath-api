class CoinTracking < ActiveRecord::Base

  validates :base_price, presence: false

  belongs_to :market_coin
  belongs_to :user

end
