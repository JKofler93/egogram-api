Rails.application.routes.draw do
  resources :follows
  resources :likes
  resources :comments
  resources :users
  
  resources :posts, only: [:show, :create, :update, :destroy, :index]  
  post "/like", to: "posts#like"
  delete "/unlike/:id", to: "posts#unlike"
  
  post "/register", to: "users#create"
  get "/users", to: "users#index"

  post "/follow", to: "users#follow"
  post "/unfollow", to: "users#unfollow"

  post "/login", to: "auth#create"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
