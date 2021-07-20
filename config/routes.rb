Rails.application.routes.draw do
  root 'events#index'
  resources :events do
    resources :regestrations
  end
end
