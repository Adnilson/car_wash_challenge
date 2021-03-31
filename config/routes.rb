Rails.application.routes.draw do
  root "cars#index"

  resources :cars do
    resources :subscriptions, except: [:index, :show, :edit]
  end
end
