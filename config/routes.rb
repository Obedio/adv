Rails.application.routes.draw do
  resources :clients, shallow: true do
    resources :lawsuits
  end
  resources :lawsuits, shallow: true do
      resources :comments
  end
  resources :accounts, shallow: true do
    resources :payments
  end
  resources :addresses, :data_users
	root 'welcome#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
