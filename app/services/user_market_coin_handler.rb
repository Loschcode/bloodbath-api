class UserMarketCoinHandler
  attr_reader :user, :market_coin

  def initialize(user:, market_coin:)
    @user = user
    @market_coin = market_coin
  end

  def find
    user_market_coin
  end

  private

  def user_market_coin
    @user_market_coin ||= existing || fresh
  end

  def existing
    UserMarketCoin.where(market_coin: market_coin, user: user).first
  end

  def fresh
    UserMarketCoin.create(market_coin: market_coin, user: user)
  end

end
