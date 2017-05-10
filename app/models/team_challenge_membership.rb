class TeamChallengeMembership < ApplicationRecord
  belongs_to :team_id
  belongs_to :challenge_id
end
