Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  resources :posts
  root to: 'static#homepage'
end
