class PostsController < ApplicationController

    def index
        posts = Post.all
        render json: posts
    end

    def show
        post = Post.find(params[:id])
        render json: { post: PostSerializer.new(post) }, status: :accepted
    end

    def create
        post = Post.create(post_params)
        
        if post.valid?
            render json: {post: PostSerializer.new(post)}, status: :accepted
        else 
            render json: { error: "Failed to create post" }, status: :not_acceptable
        end 
    end

    def update
        # VALIDATION TO CHECK CURRENT USER AGAINST POST USER FROM FRONT END
        if current_user.id === post_params[:user_id]
          post = Post.find(params[:id])
          post.update(post_params)
        end
        # SENDING BACK EITHER CREATED POST OR FAILED ERROR
        if post
          render json: {post: PostSerializer.new(post)}, status: :accepted
        else
          render json: { error: 'Failed to update post' }, status: :not_acceptable
        end
    end

    def destroy
      if current_user.id === post_params[:user_id]
        post = Post.find(params[:id])
        post.destroy
      end
      posts = Post.all
      render json: posts
    end


    ########### Methods to Like ###########

    def like
        found = Like.find_by(user_id: current_user.id, post_id: like_params[:post_id])
        if found 
            render json: { error: "Failed to like post, post has already been liked by this user." }
        else
          if current_user.id === like_params[:user_id]
            new_like = Like.create(like_params)
          end
          post = Post.find(params[:post_id])
          if new_like.valid?
            render json: {post: PostSerializer.new(post)}, status: :accepted
          else
            render json: {error: "Failed to like post"}, status: :not_acceptable
          end
        end
    end 

    def unlike
        like = Like.find(params[:id])
        like.destroy
        post = Post.find(params[:post_id])
        if !like.save
          render json: {post: PostSerializer.new(post)}, status: :accepted
        else
          render json: {error: "Failed to delete like"}, status: :not_acceptable
        end
    end

    private

    def post_params
        params.permit(:user_id, :content, :post_image)
    end

    def like_params
        params.permit(:user_id, :post_id)
    end

end
