module Mutations
  class CreateAnonymousUser < Mutations::BaseMutation
    # argument :body, String, required: true
    # argument :post_id, ID, required: true

    field :token, String, null: true

    def resolve # (body:, post_id:)
      { token: 'XXX' }
    end
  end
end
