Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get '/login/',to: 'sessions#new'
  post 'login',to: 'sessions#create'
  delete '/logout/', to: 'sessions#destroy'
  get '/administration/', to: "admins#index"
  get '/user/:id', to: 'users#index', as: 'user'

  
  
  resources :references
  resources :vendors do
    resources :products
  end
  
  
end
