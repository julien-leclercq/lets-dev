class TeamUserMembershipInvitation < ApplicationRecord
  belongs_to :team
  enum status: [:pending, :accepted, :declined]

  before_validation :set_code
  after_create :send_invitation

  validates :code, uniqueness: true, presence: true
  validates :user_email, uniqueness: {scope: :team_id, message: 'Une invitation par équipe par utilisateur'}, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

  scope :pending, -> () {where(status: :pending)}
  scope :accepted, -> () {where(status: :accepted)}
  scope :declined, -> () {where(status: :declined)}

  def send_invitation
    TeamInvitationMailer.send_invitation(self).deliver_later
  end

  private
  def set_code
    self.code = SecureRandom.uuid
  end
end
