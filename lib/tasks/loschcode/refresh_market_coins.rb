# it will call the API to get the latest coins available
# on the market and insert them on the database
class Tasks::Loschcode::RefreshMarketCoins

  def initialize
    puts "Task initialized."
  end

  def perform
    crypto_api_list.each do |details|
      market_coin = MarketCoin.where(details).first
      if market_coin
        puts "[KO] MarketCoin `#{market_coin.symbol}` already present"
      else
        market_coin = MarketCoin.create(details.merge({market_cap: 0.0, price: 0.0}))
        puts "[OK] MarketCoin `#{market_coin.symbol}` stored as `#{market_coin.id}`"
      end
    end
    puts "Task performed."
  end

  private

  def crypto_api_list
    @crypto_api_list ||= CryptoApiList.new.fetch
  end

end
