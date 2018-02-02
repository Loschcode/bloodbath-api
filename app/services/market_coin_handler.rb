class MarketCoinHandler
  attr_reader :coin_id

  def initialize(coin_id: nil)
    @coin_id = coin_id
  end

  def refresh_and_fetch
    return false unless market_coin
    refresh
    market_coin
  end

  private

  def refresh
    unless crypto_api_finder.error?
      market_coin.update!(last_state)
    end
  end

  def last_state
    {
      market_cap: crypto_api_finder.market_cap,
      price: crypto_api_finder.price,
      day_open: crypto_api_finder.day_open,
      day_high: crypto_api_finder.day_high,
      day_low: crypto_api_finder.day_low
    }
  end

  def market_coin
    @market_coin ||= MarketCoin.where(code: coin_id.upcase).first || MarketCoin.where(id: coin_id).first
  end

  def crypto_api_finder
    @crypto_api_finder ||= CryptoApiFinder.new(coin_name: market_coin.code)
  end
end
