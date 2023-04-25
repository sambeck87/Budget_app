# frozen_string_literal: true

Rails.application.routes.draw do
  root 'page#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # resources :groups
  # resources :entities
  resources :users do
    resources :groups do
      resources :entities
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
