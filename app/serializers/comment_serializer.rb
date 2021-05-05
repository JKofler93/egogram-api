class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :post_id, :user_id, :user_image


  def user_image
    object.user.profile_image
  end 


end
