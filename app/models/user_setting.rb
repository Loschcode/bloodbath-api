class UserSetting < ActiveRecord::Base

  validates :user, presence: true
  validates :default_market_coin, presence: true

  belongs_to :default_market_coin, class_name: 'MarketCoin'
  belongs_to :user, touch: true

end
