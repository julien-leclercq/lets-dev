class TeamUserMembershipInvitation < ApplicationRecord
  belongs_to :team
  enum status: [:pending, :accepted, :declined]
end
