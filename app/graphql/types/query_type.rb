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

    field :marketCoin, Types::MarketCoin, null: true do
      description "Find a market coin by ID"
      argument :id, ID, required: true
    end

    def market_coin(id:)
      return unless current_user
      ::MarketCoin.find_by(id: id)
    end

    field :marketCoins, [Types::MarketCoin], null: true do
      description "Find all market coins"
      argument :filter, Types::JsonType, required: false
    end

    def market_coins(filter:{})
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

    field :getPortfolioCoin, Types::PortfolioCoin, null: true do
      description "Find a portfolio coin by ID"
      argument :id, ID, required: true
    end

    def get_portfolio_coin(id:)
      return unless current_user
      current_user.portfolio_coins.find_by(id: id)
    end

    field :getPortfolioCoins, [Types::PortfolioCoin], null: false do
      description "Find portfolio coins"
    end

    def get_portfolio_coins
      return [] unless current_user
      current_user.portfolio_coins
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
