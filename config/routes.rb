Rails.application.routes.draw do
  get "pages/about"
  root "countries#index"

  get "about", to: "pages#about"

  resources :countries, only: [:index, :show] do
    resources :cities, only: [:index, :show]
  end

  resources :cities, only: [:show] do
    resources :attractions, only: [:index, :show]
  end

  resources :attractions, only: [:show]
end