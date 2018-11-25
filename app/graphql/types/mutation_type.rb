module Types
  class MutationType < Types::BaseObject

    field :createAnonymousUser, mutation: Mutations::CreateAnonymousUser
    #
    # field :createMarketCoin, Types::MarketCoin, null: true do
    #   description "Create market coin"
    # end
    #
    # def create_market_coin
    #   return unless current_user
    # end
  end
end
