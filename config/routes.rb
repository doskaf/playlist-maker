Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'

  resources :users do
    resources :playlists
  end

  get '/signup', to: 'users#new'
  delete '/users/:id', to: 'users#destroy'

  match 'playlists/by_category' => 'playlists#by_category', :via => :get
  resources :playlists
  delete '/playlists/:id', to: 'playlists#destroy'

  resources :songs

  resources :categories

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
end
