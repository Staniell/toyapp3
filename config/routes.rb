Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root "pages#home"

  authenticated :user, ->(user) { user.admin? } do
    get "admin", to: "admin#index"
    get "admin/new_tag"
    post "admin/new_tag", to: "admin#create_tag"
    get "admin/edit_tag/:id", to: "admin#edit_tag"
    post "admin/edit_tag/:id", to: "admin#update_tag"
    get "admin/comment_check" 
    get "admin/post_check"
    get "admin/user_check"
    get "admin/post_by_user/:id", to: "admin#post_by_user"
    delete "admin/post_by_user/:id", to: "admin#destroy_post"
    delete "admin/user_check/:id", to: "admin#destroy_user"
    delete "admin/post_check/:id", to: "admin#destroy_post"
    delete "admin/comment_check/:id", to: "admin#destroy_comment"
    delete "admin/destroy_tag/:id", to: "admin#destroy_tag"
  end

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

  get "images", to: "images#index"

  # Defines the root path route ("/")
  root "posts#index"
end
