class UsersController < ApplicationController

    def show 
        user = User.find(params[:id])
        render json: user 
    end 


    def index 
        users = User.all
        render json: users
    end

    def create
        user = User.create(user_params)
        if user.valid?
            token = encode_token({ user_id: user.id })
            render json: { user: UserSerializer.new(user), jwt: token }, status: :accepted
        else 
            render json: { error: "Failed to create user" }, status: :not_acceptable
        end 
    end 

    ########## FOLLOW AND UNFLOLLOW MEHTODS ##########

    def follow
        found = Follow.find_by(follower_id: current_user.id, followed_user_id: follow_params[:followed_user_id])
        if found 
            render json: { error: "Failed to like post, post has already been liked by this user." }
        else
          follow = Follow.create(follow_params)
          if follow.valid?
            render json: { success: "New follow created"}, status: :accepted
          else
            render json: { error: "Failed to follow user" }, status: :not_acceptable
          end
        end
    end

    def unfollow
        follow = Follow.find_by(follower_id: follow_params[:follower_id], followed_user_id: follow_params[:followed_user_id])
        user = User.find(follow_params[:followed_user_id])
        follow.destroy 
        if !follow.save
          render json: { success: "Follow was deleted" }, status: :accepted
        else
          render json: { error: "Failed to unfollow user" }, status: :not_acceptable
        end
    end

    private

    def user_params
        params.permit(:username, :bio, :email, :password, :profile_image)
    end 

    def follow_params
        params.permit(:follower_id, :followed_user_id)
    end 
end
