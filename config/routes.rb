Rails.application.routes.draw do
  devise_for :users
  root 'main#index'
  get '/', to: 'main#index'
  get '/sign_up', to: 'main#sign_up'
  get '/map', to: 'main#map'
  get '/dashboard', to: 'dashboard#index'
  get '/mapa', to: 'dashboard#map'
  get '/travel_started', to: 'dashboard#travel_started'
  get '/travel_finished', to: 'dashboard#travel_finished'
  get '/rate_travel', to: 'dashboard#rate_travel'
  get '/rate_map', to: 'dashboard#rate_map'

  post '/rating', to: 'dashboard#submit_rating'
  post '/route', to: 'dashboard#submit_route'
end
