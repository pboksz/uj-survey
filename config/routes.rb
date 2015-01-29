Rails.application.routes.draw do
  namespace :admin do
    resources :surveys do
      get :activate, on: :member
    end

    root 'surveys#index'
  end

  resources :surveys, only: [:show, :update] do
    get :thanks, on: :collection
  end

  root 'home#index'
end
