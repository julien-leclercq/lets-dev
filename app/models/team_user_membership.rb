class TeamUserMembership < ApplicationRecord
  belongs_to :team
  belongs_to :user

  enum role: [:regular, :admin]
end
