class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  validates :cvv_number, format: { with: /\A\d{3}\z/ }
  validates :credit_card_number, format: { with: /\A\d{4} \d{4} \d{4} \d{4}\z/ }
  validates :password, presence: true, length: { minimum: 8 }, format: { with: /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x }
end
