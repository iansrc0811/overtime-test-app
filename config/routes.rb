Rails.application.routes.draw do
  resources :posts
  resources :posts
  devise_for :users
  root to:'static#home'
end
