require 'bcrypt'

class UserMaker

  def initialize
  end

  def anonymous
    @anonymous ||= begin
      User.create!(
        email: anonymous_email,
        encrypted_password: encrypted(anonymous_password),
        role: :anonymous
      )
    end
  end

  private

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
