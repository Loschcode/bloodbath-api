class PortfolioCoin < ActiveRecord::Base

  validates :quantity, presence: false

  validates :user_portfolio, presence: true
  belongs_to :user_portfolio, touch: true

  belongs_to :market_coin

end
