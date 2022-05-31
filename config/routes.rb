Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :users, only: :show
  resources :posts, only: [:show, :new, :create]
end
