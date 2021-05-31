Rails.application.routes.draw do
  resources :halls, :seances, :movies, :tickets, 
            :reservations, :clients, :ticket_desks, :seats

  require 'sidekiq/web'

  MonteCinema::Application.routes.draw do
    mount Sidekiq::Web => '/sidekiq'
  end
end
