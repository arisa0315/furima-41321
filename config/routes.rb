Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  
  resources :items do
    member do
      delete :destroy
    end
  end

  resources :purchases, only: [:new, :create]
end
