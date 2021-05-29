Rails.application.routes.draw do
  resources :halls, :seances, :movies, :tickets, :reservations, :clients, :ticket_desks
end
