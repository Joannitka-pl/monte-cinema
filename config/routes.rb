# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => 'sidekiq'
  devise_for :users, defaults: { format: :json }
  resources :tickets, :halls, :reservations, :clients, :ticket_desks, :movies, :seances

  root to: 'users#index'

  resources :reservations do
    collection do
      post '/online', to: 'reservations#create_online'
      post '/offline', to: 'reservations#create_offline'
    end
  end

  resources :tickets do
    get 'validate ticket', on: :validate_ticket
  end
end
