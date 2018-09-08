class BaseController < ApplicationController

  private

  # NOTE : this should be abstracted into some kind of
  # serializer or something like that
  def coins_hash(market_coins)
    market_coins.reduce([]) do |acc, market_coin|
      acc << {
        market_coin: MarketCoinSerializer.new(market_coin),
        user_market_coin: user_market_coin(market_coin),
        portfolio_coin: portfolio_coin(market_coin)
      }
    end
  end

  # we refresh the market coins altogether
  # to avoid useless multiple calls from the API
  # we will then rely on the sockets, but the first display
  # will systematically be new fresh data.
  def refresh_market_coins(market_coins)
    MarketCoinHandler.new(coin_ids: market_coins.pluck(:id)).refresh_and_fetch
  end

  def portfolio_coin(market_coin)
    current_user.user_portfolio.portfolio_coins.where(market_coin: market_coin).first
  end

  def user_market_coin(market_coin)
    UserMarketCoinHandler.new(user: current_user, market_coin: market_coin).find
  end
end
