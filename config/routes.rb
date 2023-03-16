Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root "pages#home"
  devise_for :users
  resources :users, only: [:show, :destroy] do
    resources :posts, only: [:index]
  end
  
  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts do
    resources :comments
    resources :images
  end
  resources :comments

  # Defines the root path route ("/")
  root "posts#index"
end
