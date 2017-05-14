class Team < ApplicationRecord
  has_many :team_user_memberships
  has_many :users, through: :team_user_memberships
  has_many :team_challenge_memberships
  has_many :challenges, through: :team_challenge_memberships
end
