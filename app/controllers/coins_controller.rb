# here we get the coins with all their informations
# linked to the current user
class CoinsController < BaseController
  before_action :authenticated?

  def show
    market_coin = MarketCoinHandler.new(coin_ids: coin_id).refresh_and_fetch.take
    render json: coins_hash([market_coin]).first
  end

  def search
    market_coins = MarketCoin.search(query).default_order.limit(4)
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
