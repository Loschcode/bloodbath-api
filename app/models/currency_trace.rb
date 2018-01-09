class CurrencyTrace < ActiveRecord::Base
  validates :currency, presence: true
  validates :base_value, presence: true
  validates :current_value, presence: true
  
  belongs_to :user
end
