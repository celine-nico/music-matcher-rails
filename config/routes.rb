Rails.application.routes.draw do
  root 'sessions#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/auth/:provider/callback', to: 'sessions#omniauth'


  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :users, only: [:new, :show] do 
    resources :matches, only: [:index, :show, :new]
    resources :kpopgroups
  end 

  resources :kpopgroups
 

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  
end
