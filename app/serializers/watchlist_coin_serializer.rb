class WatchlistCoinSerializer < ActiveModel::Serializer
  attributes :id, :market_coin_id

  belongs_to :market_coin
end
