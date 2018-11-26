module Queries
  class ShowUserSetting < Queries::BaseQuery
    type Types::UserSetting, null: true
    description "Get the user setting"

    def resolve
      return unless current_user
      current_user.user_setting
    end
  end
end
