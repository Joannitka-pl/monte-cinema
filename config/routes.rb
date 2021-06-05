Rails.application.routes.draw do

      resources :tickets, :halls,
      :reservations, :clients, :ticket_desks

      resources :movies do
            resources :seances
      end

      resources :seances do
            resources :reservations
      end
      
      # resources :halls do
      #   resources :seats
      # end

end
