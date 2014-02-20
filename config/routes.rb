Dreamhouse::Application.routes.draw do
  post 'user/new', :to => 'user#new'
  get 'users' , :to => 'user#show'
  post 'login', :to => 'user#login'


  get 'log_out' => 'sessions#destroy', :as => 'log_out'
  get 'log_in' => 'sessions#new', :as => 'log_in'
  get 'sign_up' => 'users#new', :as => 'sign_up'


  resources :user
  resources :session




  root 'home#index'
end
