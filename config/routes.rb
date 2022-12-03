Rails.application.routes.draw do
  resources :cats, only: [:new, :index, :show, :destroy, :create]
end
