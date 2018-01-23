class User < ActiveRecord::Base
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :role, presence: true

  validates :token, presence: false

  has_one :user_setting, dependent: :delete
  has_one :user_portfolio, dependent: :delete
  
  has_many :user_market_coins

  # socket stream
  has_and_belongs_to_many :market_coin_streams

  before_create :ensure_token

  private

  def ensure_token
    self.token = BCrypt::Password.create(token_chain)
  end

  def token_chain
    "#{email}#{encrypted_password}#{Time.now}"
  end
end
