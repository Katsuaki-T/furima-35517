Rails.application.routes.draw do
  
  get 'messages/new'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root 'items#index'

resources :items do
  resources :purchase_histories ,only: [:index, :create]
  resources :messages, only: [:create]
end



end
