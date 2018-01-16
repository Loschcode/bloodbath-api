class MarketCoinStream < ActiveRecord::Base

  # dates
  validates :last_broadcast_at, presence: true

  # trackings
  belongs_to :market_coin
  validates :market_coin, presence: true

  # users present
  has_and_belongs_to_many :users

  scope :with_users, -> do
    self.joins(:users)
  end

  scope :broadcastable, -> do
    self.where('last_broadcast_at < ?', 10.seconds.ago)
  end

end
