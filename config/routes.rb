Rails.application.routes.draw do
  devise_for :users
  # root to: "messages#index"
  root to: "rooms#index"
  resources :messages, only:[:new,:creatw,:index]
  resources :rooms, only:[:new,:create,:index]
end
