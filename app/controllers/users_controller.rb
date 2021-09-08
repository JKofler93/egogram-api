class UsersController < ApplicationController
    # skip_before_action :authorized, only: [:create, :wakeup]

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def home 
        user = User.find(params[:user_id])
        posts = user.filter_home_posts
        render json: { posts: posts }, status: :accepted
    end 

    def show 
        user = User.find(params[:id])
        render json: user 
    end 


    def index 
        users = User.all
        render json: users
    end

    def create
        image = Cloudinary::Uploader.upload(params[:profile_image])
        @user = User.create(username: params[:username], email: params[:email], bio: params[:bio], password: params[:password], profile_image: image["url"])
        if @user.valid?
            token = encode_token({ user_id: @user.id })
            render json: { user: @user, jwt: token }
            # , status: :accepted
        else 
            render json: { error: "Failed to create user" }
            # , status: :not_acceptable
        end 
    end 

    def update
      # byebug
        if current_user.id === params[:id].to_i
            user = User.find(params[:id])
            image = Cloudinary::Uploader.upload(params[:profile_image])
            user.update(username: params[:username], email: params[:email], password: params[:password], profile_image: image["url"])
        end
        if user.valid?
          render json: { user: UserSerializer.new(user) }, status: :accepted
        else
          render json: { error: "Failed to update User"}, status: :not_acceptable
        end
    end



##################################################################################################################################################################################################################
    
    def profile2
        posts = Post.where(user_id: params[:user_id].to_i)
        newArray = posts.map{ |post| PostSerializer.new(post) }
        user = User.find(params[:user_id])
        u = UserSerializer.new(user)
        render json: { user: u, posts: newArray }, stats: :accepted
      end

    ########## FOLLOW AND UNFLOLLOW MEHTODS ##########

    def follow
        found = Follow.find_by(follower_id: current_user.id, followed_user_id: follow_params[:followed_user_id])
        if found 
            render json: { error: "You already follow this user..." }
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

    def followers
        user = User.find(params[:user_id])
        render json: { followers: UserSerializer.new(user).followers }, status: :accepted
    end
    
    def followings
        user = User.find(params[:user_id])
        render json: { followers: UserSerializer.new(user).followings }, status: :accepted
    end

    private

    # def user_params
    #     params.require(:user).permit(:username, :bio, :email, :password, :profile_image)
    # end 

    def follow_params
        params.permit(:follower_id, :followed_user_id)
    end 
end
