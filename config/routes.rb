Rails.application.routes.draw do


  get 'email/edit'
  get 'password/edit'
  match '/users',   to: 'users#index',   via: 'get'
  match '/users',   to: 'users#show',   via: 'get'
  match '/users',   to: 'users#edit',   via: 'get'
  match '/users',   to: 'users#update',   via: 'patch'
  devise_for :users, :path_prefix => 'd'
  resources :users, :only =>[:show, :index, :edit, :update]

resources :orders, only: [:new, :create]

  resources :events do 
    resources :attendances
  end
  
  root to: 'homepage#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
