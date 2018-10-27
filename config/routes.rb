Rails.application.routes.draw do

  root 'home#top'
  get '/about' => "home#about"


  devise_for :users, controllers: {
      sessions:      'users/sessions',
      passwords:     'users/passwords',
      registrations: 'users/registrations'
  }, path: "", path_names: { sign_in: "login", sign_out: "logout", password: "reset_password", }



  get '/users' => "users#index", as: 'users'
  get 'users/:id/followers' => "users#followers" , as: 'followers'
  get 'users/:id/followings' => "users#followings", as: 'followings'
  get '/users/:id' => "users#show", as: 'user'
  get '/users/:id/edit' => "users#edit", as: 'edit_user'
  patch '/users/:id' => "users#update"
  delete '/users/:id' => "users#destroy"



  resources :favorites, only: [:create, :show, :destroy ]
  resources :trips, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :reviews, only: [:new, :create, :destroy]
  end
  # 口コミのindexページ
  get '/reviews/index' => "reviews#index", as: "reviews"
  resources :relationships, only: [:create, :destroy]







  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
