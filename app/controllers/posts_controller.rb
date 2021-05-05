class PostsController < ApplicationController

    def index
        posts = Post.all
        render json: posts
    end

    def create
        @Post = Post.create(post_params)
    end

    private

    def post_params
        params.permit(:user_id, :content, :post_image)
    end

end
