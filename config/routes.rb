Rails.application.routes.draw do
  devise_for :users
  get "/" => 'home#top'
  get 'favorites/index'
  get 'home/top'
  get 'trips/new'
  get 'trips/show'
  get 'trips/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
