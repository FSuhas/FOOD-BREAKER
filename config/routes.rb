Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :events do
    resources :bookings, only: [:create, :update]
  end
  resources :bookings, only: [:destroy]
  resources :networks, except: [:new, :index]
  get '/dashboard', to: 'dashboards#dashboard'
end
