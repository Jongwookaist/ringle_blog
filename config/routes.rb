Rails.application.routes.draw do
  devise_for :users
  root "ringle#index"



  resources :articles
end