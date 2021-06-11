class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :user_id, :avatar, :username, :image, :content, :time, :likes, :like_number, :comment_number, :created_at, :comments
  # , :profile_image

  def image
    if object.post_image.attached?
      { 
        url: rails_blob_url(object.post_image)
      }
    end
    url_for(object.post_image) 
  end 

  # def post_image 
  #   url_for(object.post_image) 
  # end 

  def username
    object.user.username
  end 

  def avatar
    url_for(object.user.profile_image)
  end 

  def comments 
    object.comments.map {|comment| CommentSerializer.new(comment)}
  end

  def likes
    object.likes.map { |like| {id: like.id, post_id: like.post_id, user_id: like.user_id }}
  end

  def time
    object.determine_time
  end

  def comment_number
    comments.length
  end

  def like_number
    likes.length
  end 

end
