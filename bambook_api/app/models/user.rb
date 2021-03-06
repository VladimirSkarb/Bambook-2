class User < ApplicationRecord
  EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates_presence_of :email, :password_digest, :gender
  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEXP
  has_secure_password

  has_many :books, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :offer_subscriptions, dependent: :destroy
  has_one :wallet, dependent: :destroy
  has_many :uploaded_offer_owners
end
