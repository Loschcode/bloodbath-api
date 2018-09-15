class WatchlistCoinsController < BaseController
  before_action :authenticated?

  def index
    refresh_market_coins(watchlist_coins)
    render json: watchlist_coins, each_serializer: WatchlistCoinSerializer
  end

  def create
    @watchlist_coin = WatchlistCoin.create(
      user_watchlist: current_user.user_watchlist,
      market_coin_id: market_coin.id
    )

    if @watchlist_coin.errors.any?
      throw_error "#{@watchlist_coin.errors.full_messages.join(', ')}"
      return
    end

    render json: @watchlist_coin
  end

  def update
    watchlist_coin.update! watchlist_coin_params
  end

  def destroy
    unless watchlist_coin.destroy
      throw_error "#{watchlist_coin.errors.full_messages.join(', ')}"
      return
    end
    render json: {}
  end

  private

  def watchlist_coins
    @watchlist_coins ||= current_user.user_watchlist.watchlist_coins.order(created_at: :asc)
  end

  def watchlist_coin
    @watchlist_coin ||= WatchlistCoin.find params[:id]
  end

  def refresh_market_coins(watchlist_coins)
    MarketCoinHandler.new(coin_ids: watchlist_coins.pluck(:market_coin_id)).refresh_and_fetch
  end

  def watchlist_coin_params
    params[:watchlist_coin].permit!
  end

  def market_coin
    MarketCoin.find_by(id: watchlist_coin_params[:market_coin_id])
  end
end
