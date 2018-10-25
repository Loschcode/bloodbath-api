module Types
  class User < Types::BaseObject
    description "A user"

    field :id, ID, null: false

    field :token, String, null: false
    field :role, String, null: false
    field :email, String, null: false
    field :encrypted_password, String, null: false

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :last_seen_at, GraphQL::Types::ISO8601DateTime, null: false

    field :user_portfolio, Types::UserPortfolio, null: false
  end
end
