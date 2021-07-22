Rails.application.routes.draw do
  resources :categories
  root 'events#index'

  get 'events/filter/:filter' => 'events#index', as: :filtred_events
  resources :events do
    resources :regestrations
    resources :likes
  end
  resource :session, only: %i[new create destroy]
  resources :users
  get 'signup' => 'users#new'
end
