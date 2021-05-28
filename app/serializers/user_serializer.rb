class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :username, :bio, :email, :user_image, :followers, :followings


  def avatar
    if object.profile_image.attached?
      { 
        url: rails_blob_url(object.profile_image)
      }
    end 
    url_for(self.profile_image)
  end 

  def user_image
    url_for(object.profile_image)
  end 

  # def followers
  #   object.followers.map{ |user| UserSerializer.new(user) }
  # end

  # def followings
  #   object.followings.map { |user| UserSerializer.new(user) }
  # end
end