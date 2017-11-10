Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :contacts

    root to: "users#index"
  end

  get 'static/home'
  root to: 'static#home'
  devise_for :users
  resources :contacts
end
