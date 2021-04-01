Rails.application.routes.draw do
resources :comedians do
  resources :stand_ups, only: [:index, :show, :new]

end 

get '/signup', to: 'comedians#new'
post '/comedians', to: 'comedians#create'
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
get '/logout', to: 'sessions#destory'
resources :jokes
resources :stand_ups
end
