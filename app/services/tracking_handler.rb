class TrackingHandler
  attr_reader :user, :market_coin

  def initialize(user:, market_coin:)
    @user = user
    @market_coin = market_coin
  end

  def solve
    user_market_coin
  end

  private

  def user_market_coin
    @user_market_coin ||= begin
      UserMarketCoin.where(market_coin: market_coin, user: user).first || UserMarketCoin.create(market_coin: market_coin, user: user)
    end
  end

end
