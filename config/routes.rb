Rails.application.routes.draw do

  resources :tickets, :halls, :reservations, :clients, :ticket_desks, :movies, :seances

  resources :reservations do
    collection do
      post '/online', to: 'reservations#create_online'
      post '/offline', to: 'reservations#create_offline'
    end
  end
end
