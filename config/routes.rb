Rails.application.routes.draw do
  root 'posts#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  match 'logout', to: 'sessions#destroy', via: [:get, :delete]

  
  resources :posts do
    resources :comments, only: [:create]
  end
end
