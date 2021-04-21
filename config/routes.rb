Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  
  scope "(:locale)" do

    scope module: :users do
      resources :users, only: [:edit, :update]
    end

    resources :rooms, only:[:new,:create,:index,:destroy] do
      resources :messages, only:[:create,:index,:new]
    end
  end
end
