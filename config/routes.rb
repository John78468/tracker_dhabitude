Rails.application.routes.draw do
  resources :habits, only: [:index, :new, :create]
  patch 'habits/:id/toggle_check', to: 'habits#toggle_check', as: 'toggle_check'
  root 'habits#index'
end
