class User < ApplicationRecord
    has_one_attached :profile_image
    
    has_secure_password

    has_many :posts
    has_many :comments
    has_many :likes, through: :posts

    validates :username, :email, :password_digest, presence: true
    validates :email, uniqueness: true

    ################# FOLLOWING ASSOCIATION FOR USERS ######################
    # Will return an array of follows for the given user instance
    has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"
    # Will return an array of users who follow the user instance
    has_many :followers, through: :received_follows, source: :follower
    # returns an array of follows a user gave to someone else
    has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"
    # returns an array of other users who the user has followed
    has_many :followings, through: :given_follows, source: :followed_user

    def filter_home_posts
        user_posts = self.posts.where("profile_user_id = ? AND user_id = ?", self.id, self.id)
    
        friends_posts = self.followings.map {|user| user.posts.where("profile_user_id = ? AND user_id = ?", user.id, user.id)}
        combined = user_posts += friends_posts
        final = combined.flatten.map {|post| PostSerializer.new(post)}
    end

end