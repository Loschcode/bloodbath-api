# refresh the all time high values of the coins
class Tasks::Cron::RefreshAllTimeHigh

  def initialize
    puts "Task initialized."
  end

  def perform
    recently_checked_market_coins.each do |market_coin|

      # TODO : find another way to get the historical price because this one is not good.
      fetch = Cryptocompare::PriceHistorical.find(market_coin.code, CoinApiFinder::BASE_CURRENCY)
      all_time_high = fetch[market_coin.code][CoinApiFinder::BASE_CURRENCY]

      if all_time_high <= 0
        puts "[KO] MarketCoin `#{market_coin.code}` has no all time high"
      else
        market_coin.update all_time_high: all_time_high
        puts "[OK] MarketCoin `#{market_coin.code}` all time high is #{market_coin.all_time_high}"
      end
    end
    puts "Task performed."
  end

  private

  def recently_checked_market_coins
    MarketCoin.where('updated_at > ?', 1.days.ago)
  end
end
