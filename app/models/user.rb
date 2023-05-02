class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }, format: { with: /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x }
end
