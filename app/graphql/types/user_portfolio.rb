module Types
  class UserPortfolio < Types::BaseObject
    description 'The portfolio of a user'

    field :id, ID, null: false

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :portfolio_weather, Float, null: false

    field :user, Types::User, null: false
    field :portfolio_coins, [Types::PortfolioCoin], null: false


    # TODO  this was not thought through and does not include the quantities yet
    # please improve it
    def portfolio_weather
      variations = []
      quantities = 0

      object.portfolio_coins.each do |portfolio_coin|
        market_coin = portfolio_coin.market_coin
        next unless market_coin

        variations << market_coin.price_variation
        quantities += 1
      end

      variations.sum / quantities
    end
  end
end
