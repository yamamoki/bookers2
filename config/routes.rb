Rails.application.routes.draw do
  devise_for :users #deviseを上にしておく
  resources :books,only: [:new, :index, :show]
  resources :users, only: [:show, :edit]
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
