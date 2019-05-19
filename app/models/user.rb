class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password
  has_many :created_events, foreign_key: "creator_id", class_name: "Event"
end
