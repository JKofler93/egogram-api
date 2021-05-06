class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :post_id, :user_id


  def user_image
    object.user.profile_image
  end 


end
