class JuryChallengeMembership < ApplicationRecord
  belongs_to :user_id
  belongs_to :challenge_id
end
