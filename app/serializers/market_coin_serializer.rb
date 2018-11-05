class MarketCoinSerializer < ActiveModel::Serializer
  attributes :id, :symbol, :code, :name, :coin_name, :full_name, :logo_url,
             :market_cap, :price, :day_open, :day_high, :day_low, :all_time_high,
             :rank, :price_variation, :day_high_variation, :day_low_variation

  def price_variation
    (object.price / object.day_open - 1).to_f
  end

  def day_high_variation
    (object.day_high / object.day_open - 1).to_f
  end

  def day_low_variation
    (object.day_low / object.day_open - 1).to_f
  end
end
