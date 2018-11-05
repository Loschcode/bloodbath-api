class UserSettingSerializer < ActiveModel::Serializer
  attributes :id, :weather, :primary_market_coin_id, :base_currency_id

  belongs_to :primary_market_coin
  belongs_to :base_currency
end
