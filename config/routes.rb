Rails.application.routes.draw do
  get 'static/home'
  root to: 'static#home'
  devise_for :users
  resources :contacts
end
