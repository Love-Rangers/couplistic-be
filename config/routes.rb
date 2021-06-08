Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/events', to: 'events#index'
      post '/events', to: 'events#create'
      get '/weather', to: 'weather#index'
      get '/spotify', to: 'spotify#show'
      get '/ticketmaster', to: 'ticketmaster#index'
    end
  end
end
