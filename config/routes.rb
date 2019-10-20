Rails.application.routes.draw do
  resources :product_exits
  resources :product_entries
  resources :products
  resources :sellers
  resources :suppliers
  resources :subcategories
  resources :categories
  root to: 'dashboard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
end
