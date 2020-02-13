Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "welcome#home"
  resources :users
  get '/signup', to: 'users#new'
  delete '/users/:id', to: 'users#destroy'
  resources :playlists
  delete '/playlists/:id', to: 'playlists#destroy'
  resources :songs
  resources :categories
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
end
