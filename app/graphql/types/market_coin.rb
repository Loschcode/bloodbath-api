module Types
  class MarketCoin < Types::BaseObject
    description "A coin"

    field :id, ID, null: false
    field :code, String, null: false
  end
end
