Rails.application.routes.draw do
  devise_for :users#deviseを上にしておく
  root to: "homes#top"
  resources :users, only: [:show, :index, :edit, :create, :update]
  resources :books, only: [:edit, :index, :show, :destroy, :create, :update]

  get "home/about", to: "homes#about", as: :about

# ゲストログイン
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
