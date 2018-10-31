Rails.application.routes.draw do

  root 'home#top'
  get '/about' => "home#about"
  devise_for :users, controllers: {
      sessions:      'users/sessions',
      passwords:     'users/passwords',
      registrations: 'users/registrations'
  }, path: "", path_names: { sign_in: "login", sign_out: "logout", password: "reset_password", }
  get '/users' => "users#index", as: 'users'
  get '/users/:id' => "users#show", as: 'user'
  get '/users/:id/edit' => "users#edit", as: 'edit_user'
  patch '/users/:id' => "users#update"
  delete '/users/:id' => "users#destroy"

  resources :favorites, only: [:index]
  resources :wannagos, only: [:index]
  resources :trips, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :reviews, only: [ :index, :create, :destroy]
  end
  get '/tmp/:dareno/:dotti' => 'relationships#tmp', as: 'tmp'
  get '/follow/:id' => 'relationships#follow', as: 'follow'
  get '/count' => 'relationships#count', as: 'count'
  # お気に入り非同期のroute
  get "reviews/favorite/:id" => "reviews#favorite" , as:"favorite_reviews"
  # 行きたいの非同期のroute
  get "trips/wannago/:id" => "trips#wannago", as:"wannago_trips"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
