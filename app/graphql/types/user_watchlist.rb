module Types
  class UserWatchlist < Types::BaseObject
    description "A coin from the portfolio of a user"

    field :id, ID, null: false

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :user, Types::User, null: false
  end
end
