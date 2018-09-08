# here we get the coins with all their informations
# linked to the current user
class UserWatchlistController < BaseController
  attr_reader :market_coins

  before_action :authenticated?

  # was `favorte` in `coins`
  def show
    @market_coins = MarketCoin.favorite_of(current_user)
    refresh_market_coins(market_coins)
    market_coins.map(&:reload)

    render json: coins_hash(market_coins)
  end

  def weather
    render json: market_weather
  end

  def market_weather
    MarketWeatherHandler.new.fetch
  end

  private
end
