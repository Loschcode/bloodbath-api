class MarketCoinSerializer < ActiveModel::Serializer
  attributes :id, :symbol, :name, :coin_name, :full_name, :logo_url,
             :market_cap, :price, :day_open, :day_high, :day_low,
             :price_variation

  def price_variation
    (object.price / object.day_open - 1).to_f
  end
end
