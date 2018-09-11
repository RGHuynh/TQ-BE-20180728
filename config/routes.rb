Rails.application.routes.draw do
  resources :checkins 
  post '/login', to: "sessions#create_code"

  resources :users do 
    get '/venue_list', to: "venues#get_venue"
    post '/user_list', to: "checkins#get_user_list"

    get '/recommend_venue', to: "checkins#get_recommend_venue"
    resources :checkins 
  end


  post '/webhook/:id', to: "webhooks#receive"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
