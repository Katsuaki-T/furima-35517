Rails.application.routes.draw do

  get 'messages/new'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root 'items#index'

resources :items do
  resources :purchase_histories ,only: [:index, :create]
  resources :messages, only: [:create]
end



end
