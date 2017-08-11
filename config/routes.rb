Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      post '/login', to: 'auth#create'
      get '/me', to: 'auth#show'

      post '/signup', to: 'users#create'

      post '/create_nested', to: 'create_nested#create'

      resources :item_variations
      resources :menu_items
      resources :user_places
      resources :places
      resources :users

    end
  end
end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
