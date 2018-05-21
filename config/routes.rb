Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :teams
  resources :messages, shallow: true do
    resources :teams
  end

  root to: 'static_pages#home'
  get '/dashboard',  to: 'static_pages#dashboard'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
