class User < ApplicationRecord
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  has_many :checkins, :foreign_key => "user_id"
  has_many :webhooks, :foreign_key => "user_id"
end
