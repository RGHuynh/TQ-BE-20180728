Rails.application.routes.draw do
  resources :checkins
  post '/login', to: "sessions#create_code"
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
