Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "welcome#home"
  resources :users
  delete '/users/:id', to: 'users#destroy', as:'user'
  resources :playlists
  delete '/playlists/:id', to: 'playlists#destroy', as:'playlist'
  resources :songs
  resources :categories
end
