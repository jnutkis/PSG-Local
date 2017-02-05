Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'reference/', to: 'references#index'
  get 'reference/:short_ref', to: 'references#show'
end
