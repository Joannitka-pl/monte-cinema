require 'sidekiq/web'

Rails.application.routes.draw do
  resources :halls, :seances, :movies, :tickets, 
            :reservations, :clients, :ticket_desks, :seats


  MonteCinema::Application.routes.draw do
    mount Sidekiq::Web => '/sidekiq'
  end
end
