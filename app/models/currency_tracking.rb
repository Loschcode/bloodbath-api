class CurrencyTracking < ActiveRecord::Base

  validates :base_price, presence: false

  belongs_to :currency_state
  belongs_to :user

end
