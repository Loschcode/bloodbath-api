module Types
  class UserPortfolio < Types::BaseObject
    description "The portfolio of a user"

    field :id, ID, null: false

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :user, Types::User, null: false
  end
end
