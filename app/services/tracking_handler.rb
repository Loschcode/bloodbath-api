class TrackingHandler
  attr_reader :user, :market_coin

  def initialize(user:, market_coin:)
    @user = user
    @market_coin = market_coin
  end

  def solve
    coin_tracking
  end

  private

  def coin_tracking
    @coin_tracking ||= begin
      CoinTracking.where(market_coin: market_coin, user: user).first || CoinTracking.create(market_coin: market_coin, user: user)
    end
  end

end
