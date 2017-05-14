class Challenge < ApplicationRecord
  belongs_to :language_set
  has_many :team_challenge_memberships
  has_many :teams, through: :team_challenge_memberships
  has_many :jury_challenge_memberships
  has_many :jurys, through: :jury_challenge_memberships
end
