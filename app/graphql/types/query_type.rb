module Types
  class QueryType < Types::BaseObject
    extend ActiveSupport::Concern

    field :getUserSetting, Types::UserSetting, null: true do
      description "Find user setting of the current user"
    end

    def get_user_setting
      return unless current_user
      current_user.user_setting
    end

    field :getMarketCoin, Types::MarketCoin, null: true do
      description "Find a market coin by ID"
      argument :id, ID, required: true
    end

    def get_market_coin(id:)
      return unless current_user
      ::MarketCoin.find_by(id: id)
    end

    field :getMarketCoins, [Types::MarketCoin], null: true do
      description "Find all market coins"
    end

    def get_market_coins
      return unless current_user
      ::MarketCoin.all
    end

    field :getWatchlist, Types::UserWatchlist, null: true do
      description "Find the current user watchlist"
    end

    def get_watchlist
      return unless current_user
      current_user.user_watchlist
    end

    field :getWatchlistCoin, Types::WatchlistCoin, null: true do
      description "Find a watchlist coin by ID"
      argument :id, ID, required: true
    end

    def get_watchlist_coin(id:)
      return unless current_user
      current_user.watchlist_coins.find_by(id: id)
    end

    field :getWatchlistCoins, [Types::WatchlistCoin], null: false do
      description "Find watchlist coins"
    end

    def get_watchlist_coins
      return [] unless current_user
      current_user.watchlist_coins
    end
  end
end
