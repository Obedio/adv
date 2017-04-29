Rails.application.routes.draw do
  
  resources :profiles
  get 'control_users/index'
  get 'shares/index'
  get 'reports/index'
  get 'welcome/index'
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

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'welcome#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
