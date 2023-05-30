class User < ApplicationRecord
  validates :name, presence: true
  has_many :categories, foreign_key: "user_id"
end
