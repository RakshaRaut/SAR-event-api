# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :attendances, only: %i[create index]
  resources :participants
  resources :events
end
