Rails.application.routes.draw do
  devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
  }

  namespace :admin do
    resources :language_set_memberships
    resources :team_challenge_memberships
    resources :jury_challenge_memberships
    resources :desk_user_memberships
    resources :subscriptions
    resources :contacts
    resources :financial_movements
    resources :language_sets
    resources :languages
    resources :challenges
    resources :teams
    resources :desks

    root to: 'challenges#index'
  end

  namespace :manager do
    resources :dashboard, only: [:index]
    resources :language_sets, only: [:index, :show]
    resources :languages, only: [:index, :show]
    resources :challenges, only: [:index, :show]
    resources :teams
    resources :desks, only: [:index, :show]
    resources :me do
      get :edit, on: :collection
      get action: 'show', on: :collection
      patch action: 'update', on: :collection
      delete :facebook, on: :collection
      delete :github, on: :collection
      delete :google, on: :collection
    end

    root to: 'dashboard#index'
  end

  resources :home, only: :index

  root to: 'home#index'
end
