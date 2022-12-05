Rails.application.routes.draw do
  resources :cats
  root to: 'cats#index'

  resources :cat_versions, only: [:show]
end
