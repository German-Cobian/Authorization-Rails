Rails.application.routes.draw do
  get 'current_user', to: 'current_user#index'

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
 
  resources :users, only: [:index, :show, :update, :destroy]
  resources :rooms, only: [ :index, :show, :create ]

  resources :rooms do
    resources :participants, only: [:index, :create]
  end
end
