Tappapp::Application.routes.draw do

  resource :kiosk

  resources :beers do
    get :search, on: :collection
  end

  resources :breweries do
    get :search, on: :collection
  end

  resources :sensors do
    put :reading, on: :member
  end

  resources :taps
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
