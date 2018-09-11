require 'bcrypt'

class UserMaker

  def initialize
  end

  def authenticate(email:, password:)
    raise Exception, "Password can't be empty" unless password
    user = User.where(email: email).first
    raise Exception, "This account does not exist" unless user
    if BCrypt::Password.new(user.encrypted_password) == password
      user
    end
  end

  def convert_to_customer(user:, email:, password:)
    raise Exception, "Password can't be empty" unless password
    user.update!(
      email: email,
      encrypted_password: BCrypt::Password.create(password),
      role: :customer
    )
  end

  def anonymous
    @anonymous ||= begin
      User.create!(
        email: anonymous_email,
        encrypted_password: encrypted(anonymous_password),
        role: :anonymous
      ).tap do |user|
        user_setting(user)
        user_portfolio(user)
        base_watchlist(user)
      end
    end
  end

  private

  def user_portfolio(user)
    UserPortfolioHandler.new(user: user).find
  end

  def base_watchlist(user)
    user_watchlist = UserWatchlist.create!(
      user: user
    )
    MarketCoin.top.each do |market_coin|
      WatchlistCoin.create!(
        market_coin: market_coin,
        user_watchlist: user_watchlist
      )
    end
  end

  def user_setting(user)
    UserSetting.create!(
      user: user,
      primary_market_coin: primary_market_coin,
      base_currency: base_currency,
      weather: true
    )
  end

  def base_currency
    BaseCurrency.where(code: 'USD').take
  end

  def primary_market_coin
    MarketCoin.where(code: 'BTC').take
  end

  def encrypted(password)
    BCrypt::Password.create(password)
  end

  def anonymous_email
    "#{SecureRandom.uuid}@bloodbath.io"
  end

  def anonymous_password
    SecureRandom.uuid
  end

end
