# it will call the API to get the latest coins available
# on the market and insert them on the database
class Tasks::Cron::RefreshMarketCoins

  def initialize
    puts "Task initialized."
  end

  def perform
    crypto_api_list.each do |details|
      market_coin = MarketCoin.where(symbol: details[:symbol]).first
      if market_coin
        puts "[KO] MarketCoin `#{market_coin.symbol}` already present"
      else
        market_coin = MarketCoin.create(details.merge(empty_details))
        if market_coin.errors.empty?
          puts "[OK] MarketCoin `#{market_coin.symbol}` stored as `#{market_coin.id}`"
        else
          puts "[KO] MarketCoin `#{market_coin.symbol}` did not pass validation (`#{market_coin.errors.full_messages.join(', ')}`)"
        end
      end
    end
    puts "Task performed."
  end

  private

  def empty_details
    {
      market_cap: 0.0,
      price: 0.0,
      day_open: 0.0,
      day_high: 0.0,
      day_low: 0.0
    }
  end

  def crypto_api_list
    @crypto_api_list ||= CryptoApiList.new.fetch
  end

end
