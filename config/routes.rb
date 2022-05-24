Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'api/v1/businesses', to: "businesses#index"
  namespace :api do
    namespace :v1 do
      resources :businesses, only: %i[index show]
      resources :recommendations
    end
  end
end
