Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  namespace :api do
    namespace :v1 do
      get '/weather', to: 'weather#show'
      get '/spotify', to: 'spotify#show'
      get '/ticketmaster', to: 'ticketmaster#show'
    end
  end
end
