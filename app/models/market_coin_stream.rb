class MarketCoinStream < ActiveRecord::Base

  # trackings
  belongs_to :market_coin
  validates :market_coin, presence: true

  # users present
  has_and_belongs_to_many :users

  scope :with_users, -> do
    self.joins(:users)
  end

end
