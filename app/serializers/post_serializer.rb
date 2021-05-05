class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :user_id, :content, :post_image

  def post_image
    if object.post_image.attached?
      { 
        url: rails_blob_url(object.post_image)
      }
    end 
  end 

end
