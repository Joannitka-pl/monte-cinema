Rails.application.routes.draw do

  devise_for :users, defaults: { format: :json }
  resources :tickets, :halls, :reservations, :clients, :ticket_desks, :movies, :seances

  root to: 'users#index'

  resources :reservations do
    collection do
      post '/online', to: 'reservations#create_online'
      post '/offline', to: 'reservations#create_offline'
    end
  end
end
