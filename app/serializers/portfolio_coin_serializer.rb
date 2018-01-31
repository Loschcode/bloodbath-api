class PortfolioCoinSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :market_coin_id

  belongs_to :market_coin
end
