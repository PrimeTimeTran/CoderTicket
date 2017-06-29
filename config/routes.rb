Rails.application.routes.draw do
  devise_for :admins
  get "upcoming" => "events#index"
  resources :tickets
  resources :venues

  devise_for :users
  root 'events#index'
  get 'tickets/index' => 'tickets#index'
  get 'tickets/show' => 'tickets#show'
  get 'users/sign_out' => 'sessions#destroy'
  get 'users' => 'users#index'

  resources :events do
    get 'mine', on: :collection
    post 'publish', on: :member
    post 'unpublish', on: :member
    resources :tickets
    resources :ticket_types
  end
end
