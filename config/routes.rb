Rails.application.routes.draw do
  get "upcoming" => "events#index"
  resources :tickets

  devise_for :users
    root 'events#index'
    get 'tickets/index' => 'tickets#index'
    get 'tickets/show' => 'tickets#show'
    get 'users/sign_out' => 'sessions#destroy'

  resources :events do
    resources :tickets
  end

end
