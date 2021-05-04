class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password, length: {minimum: 3}, presence: true
end
