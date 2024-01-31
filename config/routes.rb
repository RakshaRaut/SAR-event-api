# frozen_string_literal: true

Rails.application.routes.draw do
  resources :attendances
  resources :participants
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :events
end
