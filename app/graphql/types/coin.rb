module Types
  class Coin < GraphQL::Schema::Object
    description "A coin"

    field :id, ID, null: false
    field :code, String, null: false
  end
end
