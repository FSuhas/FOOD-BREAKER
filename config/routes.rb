Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :events, except: ["index"] do
    resources :bookings, only: [:create, :update]
  end
  resources :bookings, only: [:destroy]
  resources :networks, except: [:new, :index]
  get '/dashboard', to: 'dashboards#dashboard'
  get '/profile', to: 'profiles#profile'
  get '/profile/:id', to: 'profiles#show', as: :profile_show
end
