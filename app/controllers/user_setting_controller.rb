class UserSettingController < ApplicationController
  before_action :authenticated?

  def update
    unless user_setting.update(user_setting_params)
      throw_error "#{user_setting.errors.full_messages.join(', ')}"
      return
    end

    throw_success user_setting: user_setting
  end

  private

  def user_setting_params
    params[:user_setting].permit!
  end

  def user_setting
    user.user_setting
  end

  def user
    current_user
  end

end
