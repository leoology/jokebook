Rails.application.routes.draw do
resources :comedians do
  resources :stand_ups, only: [:index, :show, :new]
end 

resources :jokes
resources :stand_ups
end
