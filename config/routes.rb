Rails.application.routes.draw do
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
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
