Rails.application.routes.draw do
  get 'finance/update'

  get 'finances/create'

  get 'finances/destroy'

  get 'rosters/show'
  get 'roster/show'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :teams, shallow: true do
    resources :messages
    resources :invitations
    resource :roster, only: [:show]
  end

  resources :messages, shallow: true do
    resources :comments
  end

  resources :finance, only: [:update]

  root to: 'static_pages#home'
  get '/dashboard',  to: 'static_pages#dashboard'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
