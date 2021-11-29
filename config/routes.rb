Rails.application.routes.draw do

  resources :events do 
    resources :attendances
  end
  devise_for :users
  root to: 'homepage#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
