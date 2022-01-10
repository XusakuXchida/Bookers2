Rails.application.routes.draw do
  devise_for :users
  root "homes#top"
  get "homes/about" => "homes#about", as: "homes_about"
  resources :books, except: [:new]
  resources :users, only: [:index, :show, :edit, :update]
end
