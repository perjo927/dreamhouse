Dreamhouse::Application.routes.draw do
  post '/user/new', :to => 'user#new'
  get '/users' , :to => 'user#show'
  post '/user/login', :to => 'user#login'
  get '/logout', :to => 'user#logout'
  get '/workspace', :to => 'home#workspace'
  post '/search', :to => 'search#newsearch'
  get '/hantverkare/show', :to => 'hantverkare#show'
  get '/hantverkare/message', :to => 'hantverkare#message'
  post '/hantverkare/sendmessage', :to => 'hantverkare#sendmessage'
  get '/room/save/:id', :to => 'room#save'
  get '/hantverkare/showmessage', :to => 'hantverkare#showmessage'
  get '/user/register/:id', :to => 'user#register'
  get '/register', :to => 'user#register'
  get '/user/message/show/:id', :to => 'user#showmessage'
  get '/user/saved_object/:id', :to => 'user#showobject'
  get '/rooms/bathrooms', :to => 'home#bathrooms'
  get '/user/saved_object/:id/edit', :to =>'user#editobject'
  get '/changetub/:id', :to => 'user#changetub'
  get '/savetub/:id/:name', :to => 'user#savetub'
  get '/changetiles/:id', :to => 'user#changetiles'
  get '/savetile/:id/:name', :to =>'user#savetiles'
  get 'user/saved_object/:id/finalize', :to => 'user#finalizeorder'
  resources :user




  root 'home#index'
end
