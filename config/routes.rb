Rails.application.routes.draw do
  namespace :admin do
    resources :surveys do
      post :activate, on: :member
      post :deactivate, on: :member
    end

    root 'surveys#index'
  end

  resources :surveys, only: [:show, :update] do
    get :thanks, on: :collection
  end

  root 'home#index'
end
