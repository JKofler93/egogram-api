class CommentSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :content, :post_id, :user_id, :avatar, :username

  def avatar
    url_for(object.user.profile_image)
  end 

  def username
    object.user.username
  end


end