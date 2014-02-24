Dreamhouse::Application.routes.draw do
  post 'user/new', :to => 'user#new'
  get 'users' , :to => 'user#show'
  post 'user/login', :to => 'user#login'

  resources :user




  root 'home#index'
end
