Rails.application.routes.draw do
  namespace :admin do
    resources :surveys
  end

  root 'home#index'
end
