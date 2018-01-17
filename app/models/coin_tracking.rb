class CoinTracking < ActiveRecord::Base

  # validates :base_price, presence: false <!-- might eventually be removed
  validates :favorite, presence: false

  belongs_to :market_coin
  belongs_to :user

  scope :with_favorite, -> { where(favorite: true) }

end
