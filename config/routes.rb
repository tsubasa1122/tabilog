Rails.application.routes.draw do
  root 'home#top'
  get '/about' => "home#about"

  devise_for :users, controllers: {
      sessions:      'users/sessions',
      passwords:     'users/passwords',
      registrations: 'users/registrations'
  }
  resources :favorites, only: [:create, :show, :destroy ]
  resources :trips, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :reviews, only: [:new, :index, :show, :create, :edit, :update, :destroy]





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
