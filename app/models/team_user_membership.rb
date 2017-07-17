class TeamUserMembership < ApplicationRecord
  belongs_to :team, optional: false
  belongs_to :user, optional: false

  enum role: [:regular, :admin]
end
