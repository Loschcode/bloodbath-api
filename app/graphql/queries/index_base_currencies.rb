module Queries
  class IndexBaseCurrencies < Queries::BaseQuery
    type [Types::BaseCurrency], null: true
    description "Get the base currencies"

    argument :filter, Types::JsonType, required: false

    def resolve(filter:{})
      return unless current_user
      ::BaseCurrency.all
    end
  end
end
