Rails.application.routes.draw do
  resources :follows
  resources :likes
  resources :comments
  resources :users, only: [:index, :create, :show, :update] do
    get '/profile', to: 'users#profile2'
    post '/follow', to: 'users#follow'
    post '/unfollow', to: 'users#unfollow'
    get '/followers', to: 'users#followers'
    get '/followings', to: 'users#followings'
    get '/home', to: 'users#home'
  end

  post "/register", to: "users#create"
  get "/users", to: "users#index"
  
  resources :posts, only: [:show, :create, :update, :destroy, :index] do 
    post "/like", to: "posts#like"
    delete "/unlike/:id", to: "posts#unlike"
  end   

  post "/follow", to: "users#follow"
  post "/unfollow", to: "users#unfollow"
  
  get "/followers", to: "users#followers"
  get "/followings", to: "users#followings"

  post "/login", to: "auth#create"
  get "/profile", to: "users#profile"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
