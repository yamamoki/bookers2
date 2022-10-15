Rails.application.routes.draw do
  devise_for :users #deviseを上にしておく
  root to: 'homes#top'
  resources :books, only: [:edit, :index, :show]
  resources :users, only: [:edit, :index, :show]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
