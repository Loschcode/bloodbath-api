class UserMarketCoin < ActiveRecord::Base
  belongs_to :user
  belongs_to :market_coin
end
