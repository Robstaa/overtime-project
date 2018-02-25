Rails.application.routes.draw do
  resources :audit_logs, only: [:index, :show, :create, :update]

  namespace :admin do
    resources :posts
    resources :users
    resources :admin_users
    resources :employees

    root to: "posts#index"
  end

  resources :posts do
    member do
      get :approve
    end
  end

  resources :audit_logs do
    member do
      get :confirm
    end
  end

  devise_for :users, skip: [:registrations]
  resources :posts
  root to: 'static#homepage'
end
