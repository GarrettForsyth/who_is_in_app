Rails.application.routes.draw do
  devise_for :users,
             controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'users/auth/google_oauth2/create_calendar_callback',
        to: 'users/omniauth_callbacks#create_google_calendar',
        as: :user_google_oauth2_create_calendar_callback
  end

  resources :teams, shallow: true do
    resources :messages
    resources :invitations
    resources :schedules
    resource :roster, only: [:show]
  end

  resources :schedules, shallow: true do
    resources :events
  end

  resources :calendars
  # resources :calendars
  # resources :schedules, shallow: true do
  # resource :calendar
  # end

  resources :teams do
    patch :remove_member
  end

  resources :messages, shallow: true do
    resources :comments
  end

  resources :finance, only: [:update]

  root to: 'static_pages#home'
  get '/dashboard', to: 'static_pages#dashboard'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
