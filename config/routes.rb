Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  devise_for :books
  devise_for :users
  get 'homes/top' #これ消したらあかんのか？
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  resources :users, only: [:edit, :show]
  resources :books, only: [:edit, :show, :new, :index]

end
