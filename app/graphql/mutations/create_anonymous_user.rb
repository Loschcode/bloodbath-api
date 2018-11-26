module Mutations
  class CreateAnonymousUser < Mutations::BaseMutation
    field :token, String, null: true

    def resolve
      # return if current_user

      {
        token: user_maker.anonymous.token
      }
    end

    private

    def user_maker
      @user_maker ||= UserMaker.new
    end
  end
end
