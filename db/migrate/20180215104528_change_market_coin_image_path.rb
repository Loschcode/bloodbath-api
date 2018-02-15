class ChangeMarketCoinImagePath < ActiveRecord::Migration[5.1]
  def change
    MarketCoin.all.each do |market_coin|
      # cryspibois
      if market_coin.code == 'CRYSP'
        market_coin.logo_url = '/static/images/coins/media/crysp.jpg'
      end
      puts "We change MarketCoin #{market_coin.id}"
      market_coin.logo_url.gsub! 'https://www.cryptocompare.com', '/static/images/coins'
      market_coin.save(validate: false)
      puts "New `logo_url` saved as `#{market_coin.logo_url}`"
    end
  end
end
