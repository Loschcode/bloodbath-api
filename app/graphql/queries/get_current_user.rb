module Queries
  class GetCurrentUser < Queries::BaseQuery
    type Types::User, null: true
    description "Get the current user"

    # argument :name, String, required: false, default_value: nil

    # field :body, String, null: true

    def resolve # (body:, post_id:)
      current_user
    end
  end
end
