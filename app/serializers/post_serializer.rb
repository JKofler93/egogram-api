class PostSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :avatar, :username, :post_image, :content, :time, :likes, :like_number, :comment_number, :created_at, :comments


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
