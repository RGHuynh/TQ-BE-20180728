Rails.application.routes.draw do
  resources :checkins 
  get '/venue_list', to: "venues#get_venue"
  post '/login', to: "sessions#create_code"

  resources :users do 
    get '/venue_list', to: "venues#get_venue"
    resources :checkins 
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
