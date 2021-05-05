class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :user_id, :content, :post_image, :time, :comments

  def post_image
    if object.post_image.attached?
      { 
        url: rails_blob_url(object.post_image)
      }
    end 
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

  def profile_image
    object.user.profile_image
  end

end
