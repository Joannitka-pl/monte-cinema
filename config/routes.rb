Rails.application.routes.draw do

      resources :tickets, :halls, :reservations, :clients, :ticket_desks, :movies, :seances
end
