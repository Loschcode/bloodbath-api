class UserPortfolio < ActiveRecord::Base
  validates :user, presence: true
  belongs_to :user, touch: true

  has_many :portfolio_coins, dependent: :delete_all
end
