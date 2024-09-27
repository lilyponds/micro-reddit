class User < ApplicationRecord
has_many :posts
has_many :comments
# validates_uniqueness_of(:username)
validates :username, presence: true, length: { maximum: 15 }
end
