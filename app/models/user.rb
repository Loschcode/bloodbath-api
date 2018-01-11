class User < ActiveRecord::Base
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :role, presence: true

  validates :token, presence: false

  has_many :coin_trackings

  before_create :ensure_token

  private

  def ensure_token
    self.token = BCrypt::Password.create(token_chain)
  end

  def token_chain
    "#{email}#{encrypted_password}#{Time.now}"
  end
end
