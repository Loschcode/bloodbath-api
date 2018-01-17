class UserMarketCoin < ActiveRecord::Base

  validates :favorite, presence: false

  belongs_to :market_coin
  belongs_to :user

  scope :with_favorite, -> { where(favorite: true) }

end
