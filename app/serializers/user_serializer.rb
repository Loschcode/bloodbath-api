class UserSerializer < ActiveModel::Serializer
  attributes :id, :token, :email, :role, :user_setting

  has_one :user_portfolio

  def user_setting
    UserSettingSerializer.new(object.user_setting)
  end
end
