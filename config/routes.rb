Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get '/login/',to: 'sessions#new'
  post 'login',to: 'sessions#create'
  delete '/logout/', to: 'sessions#destroy'
  get '/administration/', to: "admins#index"
  get '/administration/:id', to: "admins#vendor", as: "administration_vendor"
  get '/administration/:id/user/new', to: "admins#new_user", as: "administration_vendor_user"
  post '/administration/:id/user/new', to: 'admins#create_user'
  

  
  
  resources :references
  resources :vendors do
    resources :products
  end
  resources :users
  
  resources :account_activations, only: [:edit]
  
end
