Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get 'sign_out', to: 'devise/sessions#destroy' # 変更
  end

  root 'items#index'
end
