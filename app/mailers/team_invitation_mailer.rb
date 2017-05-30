class TeamInvitationMailer < ApplicationMailer
  def send_invitation(team_invitation)
    @team_invitation = team_invitation
    mail(to: team_invitation.user_email, subject: "[Let's Dev !] Votre invitation à #{team_invitation.team.name}")
  end
end
