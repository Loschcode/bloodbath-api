class UserMarketCoin < ActiveRecord::Base

  validates :favorited_at, presence: false

  belongs_to :market_coin
  belongs_to :user

  scope :with_favorite, -> { where.not(favorited_at: nil) }

end
