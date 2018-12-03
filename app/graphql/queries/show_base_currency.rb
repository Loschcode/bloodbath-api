module Queries
  class ShowBaseCurrency < Queries::BaseQuery
    type Types::BaseCurrency, null: true
    description "Get a base currency"

    argument :id, ID, required: true

    def resolve(id:)
      return unless current_user
      ::BaseCurrency.find_by(id: id)
    end
  end
end
