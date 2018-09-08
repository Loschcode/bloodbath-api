# here we get the coins with all their informations
# linked to the current user
class CoinsController < BaseController
  attr_reader :market_coin, :market_coins

  before_action :authenticated?

  def show
    market_coin = MarketCoinHandler.new(coin_ids: coin_id).refresh_and_fetch.take

    # TODO this is the exact same than coin_hash except it's for one
    # could be changer and abstracted
    render json: {
      market_coin: MarketCoinSerializer.new(market_coin),
      user_market_coin: user_market_coin(market_coin),
      portfolio_coin: portfolio_coin(market_coin)
    }
  end

  def search
    @market_coins = MarketCoin.search(query).default_order.limit(4)
    render json: coins_hash(market_coins)
  end

  private

  def coin_id
    params[:id]
  end

  def query
    params[:query]
  end
end
