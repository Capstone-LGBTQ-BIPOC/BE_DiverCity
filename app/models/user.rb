class User < ApplicationRecord
validates :user_name, presence: true, uniqueness: true
end
