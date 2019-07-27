require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :users

  root 'products#index'
  
  resources :products do
    post 'import', on: :collection
    get 'download_csv', on: :collection
  end
  resources :api_tokens

  mount Sidekiq::Web, at: '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
