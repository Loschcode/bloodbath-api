module Types
  class BaseCurrency < Types::BaseObject
    description "The base currency used to convert values to understandable fiat money"

    field :code, String, null: false
    field :exchange_rate, Float, null: false
    field :symbol, String, null: false
    field :full_name, String, null: false

    field :user_settings, [Types::UserSetting], null: true
  end
end
