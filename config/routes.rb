Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "pages#home"
  devise_for :users
  "testing"
  # Defines the root path route ("/")
  # root "articles#index"
end
