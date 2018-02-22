Rails.application.routes.draw do
  resources :audit_logs, only: [:index, :show, :create, :update]

  namespace :admin do
    resources :posts
    resources :users
    resources :admin_users

    root to: "posts#index"
  end

  devise_for :users, skip: [:registrations]
  resources :posts
  root to: 'static#homepage'
end
