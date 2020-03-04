Rails.application.routes.draw do
  resources :mbg_verticles
  resources :verge_articles
  resources :user_articles
  resources :articles
  resources :users
  post '/login', to: 'auth#login'
  post '/users', to: 'auth#create'
  get '/profile', to: 'users#profile'
end
