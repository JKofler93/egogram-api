class CommentsController < ApplicationController

    def create
        comment = Comment.create(comment_params)
        post = Post.find(comment_params[:post_id])
        if comment.valid?
          render json: { post: PostSerializer.new(post), comment: comment.user }, status: :accepted
        else 
          render json: { error: 'Failed to create comment' }, status: :not_acceptable
        end
    end
    
    
    private

    def comment_params
      params.permit(:content, :post_id, :user_id)
    end


end
