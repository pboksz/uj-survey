Rails.application.routes.draw do
  namespace :admin do
    resources :surveys
  end

  resources :surveys, only: [:show, :update]

  root 'home#index'
end
