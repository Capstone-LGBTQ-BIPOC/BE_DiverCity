# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index]
      resources :category_1, only: [:index]
      resources :category_2, only: [:index]
      resources :category_3, only: [:create]
      # resources :random_thing, only: [:index], controller: :yelp
      # resources :routing, only: [:create]
    end
  end
end
