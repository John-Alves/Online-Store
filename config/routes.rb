Rails.application.routes.draw do

  namespace :product_exits do
    post 'edit', action: 'update'
  end
  resources :product_exits

  namespace :product_entries do
    post 'edit', action: 'update'
  end
  resources :product_entries

  namespace :products do
    post 'edit', action: 'update'
  end
  resources :products

  namespace :sellers do
    post 'edit', action: 'update'
  end
  resources :sellers

  namespace :suppliers do
    post 'edit', action: 'update'
  end
  resources :suppliers

  namespace :subcategories do
    post 'edit', action: 'update'
  end
  resources :subcategories

  namespace :categories do
    post 'edit', action: 'update'
  end
  resources :categories

  root to: 'dashboard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
end
