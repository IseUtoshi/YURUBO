Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :users, only: :show do
    collection do
      get 'search'
    end
    member do
      get :follows, :followers
    end
    resources :follows, only: [:create, :destroy]
  end
  resources :posts, except: :index
  resources :games, only: [:create, :destroy]
end
