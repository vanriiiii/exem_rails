class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 15}
  validates :email, presence: true, length: {maximum: 255},
            format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
  has_many :owatters
  has_many :favorites, dependent: :destroy
  has_many :favorite_owatters, through: :favorites, source: :owatter
end
