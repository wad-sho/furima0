Rails.application.routes.draw do
  devise_for :wadas
  root 'items#index'
  resources :items do
    resources :orders 
  end
end
