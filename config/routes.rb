Rails.application.routes.draw do

  devise_for :users#deviseを上にしておく
  root to: 'homes#top'
  resources :users, only: [:show, :index, :edit, :create, :update]
  resources :books, only: [:edit, :index, :show, :destroy, :create, :update]

  get "/homes/about" => "homes#about", as: "about"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
