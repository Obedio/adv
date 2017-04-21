Rails.application.routes.draw do
  
  resources :profiles
  get 'control_users/index'
  get 'shares/index'
  get 'reports/index'
  resources :clients, shallow: true do
    resources :lawsuits
  end
  resources :lawsuits, shallow: true do
    resources :payments
  end
  resources :lawsuits, shallow: true do
    resources :observations
  end
  resources :lawsuits, shallow: true do
    resources :annexes
  end
  resources :lawsuits, shallow: true do
    resources :shares
  end
  resources :addresses
	root 'welcome#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
