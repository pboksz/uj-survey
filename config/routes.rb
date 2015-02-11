Rails.application.routes.draw do
  namespace :admin do
    resources :surveys do
      post :activate, on: :member
      post :deactivate, on: :member
    end
  end

  resources :surveys, only: [:show, :update] do
    get :thanks, on: :collection
  end

  mount AdminAuth::Engine, at: '/admin'

  root 'home#index'
end
