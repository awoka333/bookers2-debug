Rails.application.routes.draw do
  get 'home/about'
  get 'home/top'
  devise_for :users
  root 'home#top'
  get 'home/about' => 'home#about', as: 'about'
  resources :users, only: [:show,:index,:edit,:update]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end