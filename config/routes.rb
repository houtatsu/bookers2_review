Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'homes/about', as: "about"
  resources :books, only: [:create, :index, :show, :edit, :destroy], as: "books"
  resources :users, only: [:create, :index, :show, :edit], as: "users"
end
