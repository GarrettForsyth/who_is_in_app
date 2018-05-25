Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :teams, shallow: true do
    resources :messages
    resources :invitations
  end

  resources :messages, shallow: true do
    resources :comments
  end

  root to: 'static_pages#home'
  get '/dashboard',  to: 'static_pages#dashboard'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
