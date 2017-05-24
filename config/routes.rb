Rails.application.routes.draw do
  devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
  ActiveAdmin.routes(self)

  namespace :manager do
    resources :dashboard, only: [:index]
    resources :language_sets, only: [:index, :show]
    resources :languages, only: [:index, :show]
    resources :challenges, only: [:index, :show]
    resources :teams
    resources :desks, only: [:index, :show]
    resources :me do
      get action: :show, on: :collection, as: :show
      patch action: :update, on: :collection, as: :update
      delete :facebook, on: :collection
      delete :github, on: :collection
      delete :google, on: :collection
    end

    root to: 'dashboard#index'
  end

  resources :home, only: :index
  resources :challenges, only: [:index, :show]

  root to: 'home#index'
end
