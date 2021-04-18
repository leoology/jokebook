Rails.application.routes.draw do
resources :comedians do
  resources :stand_ups, only: [:index, :new, :edit, :destroy]
  resources :jokes, only: [:index, :new, :edit]

end 
root to: 'sessions#home'
get '/signup', to: 'comedians#new'
post '/comedians', to: 'comedians#create'
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'
get '/home', to: 'sessions#home'
get 'auth/:provider/callback', to: 'sessions#omniauth'
resources :jokes, only: [:index]
resources :stand_ups, only: [:index]
get '/favorite', to: 'jokes#favorite'
end
