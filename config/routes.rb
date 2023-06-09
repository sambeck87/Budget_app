# frozen_string_literal: true

Rails.application.routes.draw do
  root 'page#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users do
    resources :groups do
      resources :entities
    end
  end
end
