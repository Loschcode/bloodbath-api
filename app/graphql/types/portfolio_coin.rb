module Types
  class PortfolioCoin < Types::BaseObject
    description "A coin from the portfolio of a user"

    field :id, ID, null: false

    field :quantity, Float, null: false

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :user_portfolio, Types::UserPortfolio, null: false
    field :market_coin, Types::MarketCoin, null: false
  end
end
