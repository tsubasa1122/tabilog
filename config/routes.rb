Rails.application.routes.draw do

  root 'home#top'
  get '/about' => "home#about"
  get '/trips/:id' => 'trips#index', as: 'trips'


  devise_for :users, controllers: {
      sessions:      'users/sessions',
      passwords:     'users/passwords',
      registrations: 'users/registrations'
  }, path: "", path_names: { sign_in: "login", sign_out: "logout", password: "reset_password", }


  resources :users, only: [:show, :edit, :update, :destroy]
  get '/users/:id/follower' => 'relationships#follower', as: 'follwer'
  get '/users/:id/followings' => 'relationships#followings', as: 'followings'


  resources :favorites, only: [:create, :show, :destroy ]
  resources :trips, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :reviews, only: [:new, :index, :show, :create, :edit, :update, :destroy]





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
