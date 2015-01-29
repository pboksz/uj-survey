Rails.application.routes.draw do
  namespace :admin do
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'

    resources :surveys do
      post :activate, on: :member
      post :deactivate, on: :member
    end

    root 'sessions#new'
  end

  resources :surveys, only: [:show, :update] do
    get :thanks, on: :collection
  end

  root 'home#index'
end
