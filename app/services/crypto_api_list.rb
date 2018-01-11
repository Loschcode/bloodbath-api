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
        proof_type: data.last['ProofType']
      }
    end
  end

  private

  def list
    @list ||= Cryptocompare::CoinList.all
  end

end
