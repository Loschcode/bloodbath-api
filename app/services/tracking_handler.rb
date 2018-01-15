class TrackingHandler
  attr_reader :user, :market_coin

  def initialize(user:, market_coin:)
    @user = user
    @market_coin = market_coin
  end

  def solve
    unless coin_tracking.base_price
      coin_tracking.update!(base_price: crypto_api_finder.price)
    end
    coin_tracking
  end

  def reset
    coin_tracking.destroy
  end

  private

  def coin_tracking
    @coin_tracking ||= begin
      CoinTracking.where(market_coin: market_coin, user: user).first || CoinTracking.create(market_coin: market_coin, user: user)
    end
  end

  def crypto_api_finder
    @crypto_api_finder ||= CryptoApiFinder.new(currency: market_coin.symbol)
  end

end
