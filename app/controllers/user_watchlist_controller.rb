# we get the watchlist and the user coins
class UserWatchlistController < BaseController
  before_action :authenticated?

  def show
    render json: user_watchlist.as_json(include: :watchlist_coins)
  end

  def update
    unless user_watchlist.update(user_watchlist_params)
      throw_error "#{user_watchlist.errors.full_messages.join(', ')}"
      return
    end
  end

  private

  def user_watchlist_params
    params[:user_watchlist].permit!
  end

  def user_watchlist
    @user_watchlist ||= UserWatchlist.find params[:id]
  end
end
