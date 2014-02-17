Tappapp::Application.routes.draw do
  resources :taps

  resources :beers

  resources :breweries

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end