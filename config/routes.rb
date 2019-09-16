Rails.application.routes.draw do
  get 'days/new'
  get 'days/close'
  get 'registro', to: 'days#registro'
  get 'subscription/new'
  devise_for :users, controllers: { registrations: 'user/registrations'}
  root 'home#home'
  get 'searchpeople', to: 'people#search'
  resources :people
  resources :years
  get 'subscription', to: 'subscription#new'  
  post 'subscription', to: 'subscription#create' 
  get 'printed', to: 'people#printed' 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
