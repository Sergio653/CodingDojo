class User < ApplicationRecord
  has_secure_password
  has_many :joins, dependent: :destroy
  has_many :orgs, dependent: :destroy
  has_many :joined_orgs, through: :joins, source: :joins
  
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, presence: true
  validates :email, presence:true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, length: { minimum: 6, maximum: 12 }, on: :create
end
