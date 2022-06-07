Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :users, only: :show do
    member do
      get :follows, :followers
    end
    resources :follows, only: [:create, :destroy]
  end
  resources :posts, only: [:show, :new, :create]
  resources :games, only: :create
end
