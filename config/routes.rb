Rails.application.routes.draw do
  resources :nights
  resources :days
  devise_for :users,
             controllers: {
               registrations: 'registrations',
               sessions: 'sessions'
             }

  resources :users

  root to: 'sessions#new'
end
