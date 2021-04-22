Rails.application.routes.draw do
resources :comedians do
  resources :stand_ups, only: [:index, :new, :edit, :destroy, :update, :create]
  resources :jokes, only: [:index, :new, :edit, :create]

end 
root to: 'sessions#home'
get '/signup', to: 'comedians#new'
post '/comedians', to: 'comedians#create'
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'
get '/home', to: 'sessions#home'
get 'auth/:provider/callback', to: 'sessions#omniauth'
resources :jokes, only: [:index, :update]
resources :stand_ups, only: [:index]
post 'comedian/:id/jokes/:id/favorite', to: 'comedian_jokes#favorite', as: :favorite
#post '/comedians/:id/stand_ups/new', to:'stand_ups#create'
#post '/comedians/:id/jokes/new', to:'jokes#create'
get '/age', to: 'comedians#age'
end
