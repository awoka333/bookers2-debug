Rails.application.routes.draw do
  get 'search/search'
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
  post 'follow/:id' => 'relationships#create', as: 'follow'
  post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow'
  get 'followed/:id' => 'relationships#followed', as: 'followed'
  get 'follower/:id' => 'relationships#follower', as: 'follower'
  get 'search' => 'search#search'
end