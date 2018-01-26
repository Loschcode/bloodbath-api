class BaseCurrency < ActiveRecord::Base

  validates :code, presence: true # USD

  # the exchange rate is always based from USD to the current currency
  validates :exchange_rate, presence: true # 1.00

  validates :symbol, presence: true # $
  validates :full_name, presence: true # United States Dollars

  has_many :user_settings # could make good stats over that

end
