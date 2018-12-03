module Queries
  class IndexBaseCurrencies < Queries::BaseQuery
    type [Types::BaseCurrency], null: true
    description "Get the market coins"

    argument :filter, Types::JsonType, required: false

    def resolve(filter:{})
      return unless current_user
      ::BaseCurrency.all
    end
  end
end
