require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'api/v1/businesses', to: "businesses#index"
  namespace :api do
    namespace :v1 do
      resources :businesses, only: [:index, :show]
      resources :recommendations
    end
  end
end
