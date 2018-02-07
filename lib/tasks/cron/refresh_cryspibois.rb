# the cryspibois are in da place yo
class Tasks::Cron::RefreshCryspibois

  def initialize
    puts "Task initialized."
  end

  def perform
    puts "Let's add some CryspiBois"
    cryspibois
    puts "Task performed."
  end

  private

  def cryspibois
    MarketCoin.where(symbol: 'CRYSP').delete_all
    MarketCoin.create(details)
  end

  def details
    {
      symbol: 'CRYSP',
      name: 'CRYSP',
      coin_name: 'CryspiBois',
      code: 'CRYSP',
      full_name: 'CryspiBois (CRYSP)',
      logo_url: 'http://cdn.playbuzz.com/cdn/1b8579b7-f9c9-4236-85a5-6e7027f312f5/07c0d462-4736-443a-818b-212dd95b915b.jpg',
      algorithm: 'Chicken Nuggets Engine',
      proof_type: 'Incredible Taste',

      market_cap: 1000000000,
      price: 10.0,
      day_open: 9.0,
      day_high: 11.0,
      day_low: 9.0
    }
  end

end
