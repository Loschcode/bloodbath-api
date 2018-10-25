module Types
  class UserMarketCoin < Types::BaseObject
    description "A market coin from a user (this should become obsolete as we have the watch list now ?)"

    field :id, ID, null: false

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :user, Types::User, null: false
    field :market_coin, Types::MarketCoin, null: false
  end
end
