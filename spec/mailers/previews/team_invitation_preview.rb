class TeamInvitationPreview < ActionMailer::Preview
  def send_invitation
    TeamInvitationMailer.send_invitation(TeamUserMembershipInvitation.new(team: Team.first, user_email: User.first.email))
  end
end
