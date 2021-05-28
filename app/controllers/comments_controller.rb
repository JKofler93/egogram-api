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

    def update
      comment = Comment.find(params[:id])
      comment.update(comment_params)
      post = Post.find(comment.post_id)
      if comment.valid?
        render json: { post: PostSerializer.new(post) }, status: :accepted
      else 
        render json: { error: 'Failed to update comment' }, status: :not_acceptable
      end
    end

    def destroy
      comment = Comment.find(params[:id])
      comment.destroy
      post = Post.find(comment.post_id)
      if !comment.save 
        render json: { post: PostSerializer.new(post) }, status: :accepted
      else
        render json: {error: 'Failed to delete comment', comment: comment}, status: :not_acceptable
      end
    end
    
    
    private

    def comment_params
      params.require(:comment).permit(:content, :post_id, :user_id)
    end


end
