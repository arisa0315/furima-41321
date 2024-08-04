Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy'
  end

  root 'items#index'
end
