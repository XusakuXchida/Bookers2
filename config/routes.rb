Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'books/index'
  get 'books/create'
  get 'books/show'
  get 'books/edit'
  get 'books/update'
  get 'books/destroy'
  devise_for :users
  root "homes#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
