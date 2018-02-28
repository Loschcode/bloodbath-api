require 'cryptocompare'

class MarketcoincapApi

  def initialize
  end

  def fetch
    list.reduce([]) do |acc, data|
      acc << {
        code: data['symbol'],
        symbol: data['symbol'],
        name: data['name'],
        rank: data['rank']
      }
    end
  end

  private

  def list
    @list ||= begin
      json = Parser.get_json 'https://api.coinmarketcap.com/v1/ticker/'
      if json.instance_of? Array
        json
      else
        []
      end
    end
  end

end
