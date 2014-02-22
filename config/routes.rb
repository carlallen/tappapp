Tappapp::Application.routes.draw do
  resources :taps

  resources :beers

  resources :breweries

  root :to => "taps#index"
  devise_for :users, controllers: {
    registrations: "registrations"
  }
  as :user do
    get 'users/edit' => 'devise/registrations#edit', as: 'edit_user_registration'
    put 'users/:id' => 'devise/registrations#update', as: 'user_registration'
  end
  resources :users
end
