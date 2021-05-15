Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  root 'items#index'

resources :items do
  resources :purchase_histories ,only: [:index, :create]
end

resources :messages, only: [:create]

end
