class Post < ApplicationRecord
    has_one_attached :post_image

    belongs_to :user
    has_many :likes
    has_many :users, through: :likes
    has_many :comments
    has_many :users, through: :comments
    
end
