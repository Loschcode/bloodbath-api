class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable
  include DeviseTokenAuth::Concerns::User

  has_many :currency_traces
end
