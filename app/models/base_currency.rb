class BaseCurrency < ActiveRecord::Base

  validates :code, presence: true # USD

  # the exchange rate is always based from USD to the current currency
  validates :exchange_rate, presence: true # 1.00

  validates :symbol, presence: true # $
  validates :full_name: presence: true # United States Dollars

  validates

end
