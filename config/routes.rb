Rails.application.routes.draw do
  resources :cars do
    resources :subscriptions, except: [:index, :show, :edit]
  end
end
