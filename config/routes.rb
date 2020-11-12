Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
    collection do
      get 'search'
    end
  end
  resources :categorys, only: [:show]
end
