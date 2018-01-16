require 'cryptocompare'

class CryptoApiList

  def initialize
  end

  def fetch
    list['Data'].reduce([]) do |acc, data|
      acc << {
        symbol: data.last['Symbol'],
        name: data.last['Name'],
        coin_name: data.last['CoinName'],
        full_name: data.last['FullName'],
        algorithm: data.last['Algorithm'],
        proof_type: data.last['ProofType'],
        sort_order: data.last['SortOrder'],
        # we manipulate the URL because it's not only a path
        # we can change it easily this way.
        logo_url: logo_url(data)
      }
    end
  end

  private

  def logo_url(data)
    if data.last['ImageUrl']
      "https://www.cryptocompare.com#{data.last['ImageUrl']}"
    else
      ""
    end
  end

  def list
    @list ||= Cryptocompare::CoinList.all
  end

end
