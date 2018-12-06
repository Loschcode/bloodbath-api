module Mutations
  class CreateWatchlistCoin < Mutations::BaseMutation
    argument :market_coin_id, ID, required: true

    field :id, ID, null: false

    def resolve(market_coin_id:)
      return unless current_user

      current_user.user_watchlist.watchlist_coins.delete_all

      market_coin = ::MarketCoin.find(market_coin_id)
      watchlist_coin = ::WatchlistCoin.create!(
        market_coin: market_coin,
        user_watchlist: current_user.user_watchlist
      )

      {
        id: watchlist_coin.id
      }
    end
  end
end
