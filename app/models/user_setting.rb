class UserSetting < ActiveRecord::Base

  validates :user, presence: true
  validates :primary_market_coin, presence: true

  belongs_to :primary_market_coin, class_name: 'MarketCoin'
  belongs_to :user, touch: true

end
