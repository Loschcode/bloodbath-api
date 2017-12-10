class CurrencyTrace < ActiveRecord::Base
  field :currency, type: Symbol
  field :base_value, type: Float
  field :current_value, type: Float

  belongs_to :user
end
