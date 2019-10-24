class Org < ApplicationRecord
  belongs_to :user
  has_many :joins, dependent: :destroy
  has_many :users, through: :joins, source: :user

  validates :name, presence:true, length: {minimum: 6 }
  validates :desc, presence:true, length: {minimum: 11}
end
