class TeamChallengeMembership < ApplicationRecord
  belongs_to :team
  belongs_to :challenge
end
