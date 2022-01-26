Rails.application.routes.draw do
  devise_for :wadas, controllers: {
    omniauth_callbacks: 'wadas/omniauth_callbacks',
    registrations: 'wadas/registrations'
  }
  root 'items#index'
  resources :items do
    resources :orders 
  end
end
