Rails.application.routes.draw do

  resources :product_exits, except: [:show]
  resources :product_entries, except: [:show]
  resources :products, except: [:show]
  resources :sellers, except: [:show]
  resources :suppliers, except: [:show]
  resources :subcategories, except: [:show]
  resources :categories, except: [:show]

  root to: 'dashboard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
end
