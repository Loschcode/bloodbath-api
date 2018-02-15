# the cryspibois are in da place yo
class Tasks::Cron::RefreshCryspibois

  def initialize
    puts "Task initialized."
  end

  def perform
    puts "Let's add some CryspiBois"
    cryspibois.update(details)
    puts "Task performed."
  end

  private

  def cryspibois
    MarketCoin.where(symbol: 'CRYSP').first || MarketCoin.create(details)
  end

  def details
    {
      symbol: 'CRYSP',
      name: 'CRYSP',
      coin_name: 'CryspiBois',
      code: 'CRYSP',
      full_name: 'CryspiBois (CRYSP)',
      logo_url: '/static/images/coins/media/crysp.jpg',
      algorithm: 'Chicken Nuggets Engine',
      proof_type: 'Incredible Taste',

      market_cap: 1000000000,
      price: 0.25,
      day_open: 0.20,
      day_high: 0.30,
      day_low: 0.20
    }
  end

end
