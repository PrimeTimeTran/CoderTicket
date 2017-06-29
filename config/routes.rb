Rails.application.routes.draw do

  devise_for :admins
  get "upcoming" => "events#index"
  resources :tickets
  resources :venues
  resources :users

  devise_for :users
    root 'events#index'
    get 'tickets/index' => 'tickets#index'
    get 'tickets/show' => 'tickets#show'
    get 'users/sign_out' => 'sessions#destroy'

  resources :events do
    resources :tickets
    resources :ticket_types
  end
end
