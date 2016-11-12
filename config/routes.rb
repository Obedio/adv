Rails.application.routes.draw do
  resources :payments
  resources :accounts
  resources :status_payments
  resources :comments
  resources :lawsuits
  resources :kinds
  resources :venues
  resources :statuses
  resources :clients
  resources :addresses
  resources :data_users
  resources :offices
	root 'welcome#index'
  get 'welcome/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
