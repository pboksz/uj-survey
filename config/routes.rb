Rails.application.routes.draw do
  namespace :admin do
    resources :surveys, only: [:index, :new]
  end

  namespace :api do
    resources :surveys, only: [:create]
  end

  root 'home#index'
end
