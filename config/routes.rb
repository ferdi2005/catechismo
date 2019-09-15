Rails.application.routes.draw do
  get 'subscription/new'
  devise_for :users, controllers: { registrations: 'user/registrations'}
  root 'home#home'
  get 'searchpeople', to: 'people#search'
  resources :people
  resources :years
  get 'subscription', to: 'subscriptions#new'  
  post 'subscription', to: 'subscriptions#create'  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
