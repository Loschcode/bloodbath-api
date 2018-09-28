module Types
  class MarketCoin < GraphQL::Schema::Object
    description "A coin"

    field :id, ID, null: false
    field :code, String, null: false
  end
end
