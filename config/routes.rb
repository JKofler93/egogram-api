Rails.application.routes.draw do
  resources :follows
  resources :likes
  resources :comments
  resources :posts
  resources :users
  
  post "/posts", to: "posts#create"
  get "/posts", to: "posts#index"

  post "/users", to: "users#create"
  get "/users", to: "users#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
