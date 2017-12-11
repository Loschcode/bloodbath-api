class User < ApplicationRecord
  has_secure_password

  field :email, type: String # not sure we should have this
  field :password_digest, type: String # not sure we should have this
  field :role, type: Symbol, default: :user
end
