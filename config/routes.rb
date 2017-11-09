Rails.application.routes.draw do
  resources :contacts
  root to: 'contacts#home'
end
