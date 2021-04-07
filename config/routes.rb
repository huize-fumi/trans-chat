Rails.application.routes.draw do
  devise_for :users
  root to: "messages#index"
  resources :messages, only:[:new,:create]
  resources :rooms, only:[:new,:create]
end
