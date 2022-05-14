Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get 'api/v1/businesses', to: "businesses#index"
  namespace :api do
    namespace :v1 do
      resources :businesses, only: [:index]
      resources :category_2, only: [:index]
      resources :category_3, only: [:create]
      #resources :random_thing, only: [:index], controller: :yelp
      #resources :routing, only: [:create]
    end
  end
end
