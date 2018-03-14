Rails.application.routes.draw do

  get 'sessions/new'

  get 'users/new'

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  # get "sign_up" => "users#new", :as => "sign_up"
  root :to => "users#new"

  resources :users
  resources :sessions
  
  # the landing page
  match '/home',to: 'pages#home', via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
