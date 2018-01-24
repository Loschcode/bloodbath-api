require 'bcrypt'

class UserMaker

  def initialize
  end

  def authenticate(email:, password:)
    user = User.where(email: email).first
    if BCrypt::Password.new(user.encrypted_password) == password
      user
    end
  end

  def convert_to_customer(user:, email:, password:)
    user.update!(
      email: email,
      encrypted_password: BCrypt::Password.new(password),
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
      end
    end
  end

  private

  def user_setting(user)
    UserSetting.create!(
      user: user,
      default_market_coin: default_market_coin
    )
  end

  def default_market_coin
    MarketCoin.where(name: 'BTC').first
  end

  def encrypted(password)
    BCrypt::Password.create(password)
  end

  def anonymous_email
    "#{SecureRandom.uuid}@cryptoscreen.com"
  end

  def anonymous_password
    SecureRandom.uuid
  end

end
