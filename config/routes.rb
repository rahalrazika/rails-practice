Rails.application.routes.draw do
  get 'events' => 'events#index'
  get 'events/1' => 'events#show'
end
