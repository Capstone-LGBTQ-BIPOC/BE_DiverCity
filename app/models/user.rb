class User < ApplicationRecord
  validates :user_name, presence: true, uniqueness: true
  has_many :user_recommendations
end
