class UserSetting < ActiveRecord::Base

  belongs_to :default_market_coin, class_name: 'MarketCoin'
  belongs_to :user
  
end
