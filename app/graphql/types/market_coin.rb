module Types
  class MarketCoin < Types::BaseObject
    description "A coin"

    field :id, ID, null: false

    field :code, String, null: false
    field :symbol, String, null: false
    field :name, String, null: false
    field :coin_name, String, null: false
    field :full_name, String, null: false
    field :logo_url, String, null: false
    field :algorithm, String, null: false
    field :proof_type, String, null: false
    field :market_cap, String, null: false

    field :price, Float, null: false
    field :day_open, Float, null: false
    field :day_high, Float, null: false
    field :day_low, Float, null: false
    # this is not good for now
    field :all_time_high, Float, null: false

    field :rank, Integer, null: false

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
