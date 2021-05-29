Rails.application.routes.draw do
  resources :halls, :seances, :movies, :tickets
end
