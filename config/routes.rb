Rails.application.routes.draw do
  admin_auth_routes

  namespace :admin do
    resources :surveys do
      post :activate, on: :member
      post :deactivate, on: :member
    end
  end

  resources :surveys, only: [:show, :update] do
    get :thanks, on: :collection
  end

  root 'home#index'
end
