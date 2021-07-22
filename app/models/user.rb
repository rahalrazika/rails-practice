class User < ApplicationRecord
  has_secure_password
  has_many :regestrations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_event, through: :likes, source: :event


  validates :name, presence: true
  validates :email, format: { with: /\S+@\S+/ }, uniqueness: { case_sensitive: false }
end
