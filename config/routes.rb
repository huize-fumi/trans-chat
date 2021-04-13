Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  
  scope "(:locale)" do

    scope module: :users do

      resources :users, only: [:edit, :update]
    end

    resources :rooms, only:[:new,:create,:index] do
      resources :messages, only:[:create,:index]
    end
  end
end
