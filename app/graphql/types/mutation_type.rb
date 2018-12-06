module Types
  class MutationType < Types::BaseObject
    field :createAnonymousUser, mutation: Mutations::CreateAnonymousUser

    field :createWatchlistCoin, mutation: Mutations::CreateWatchlistCoin
  end
end
