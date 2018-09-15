module Types
  class QueryType < Types::BaseObject

     field :coin, [Types::Coin], null: true do
       description "Find a coin by ID"
       argument :id, ID, required: true
     end

     def coin(id:)
       MarketCoin.find(id)
     end

     field :coins, [Types::Coin], null: false do
       description "Find all coins"
     end

     def coins
       MarketCoin.all
     end
  end
end

# query_string = "
# {
#   coins {
#     id
#     code
#   }
# }"
#
# result_hash = BloodbathApiSchema.execute(query_string)
