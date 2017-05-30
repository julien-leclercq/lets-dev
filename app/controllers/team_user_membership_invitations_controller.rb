class TeamUserMembershipInvitationsController < ApplicationController
  before_action :set_invitation_by_code

  def accept

    # If doesn't exist
    if @invitation.nil?
      redirect_to redirect_path, alert: "Cette invitation n'existe pas"

    # If not pending
    elsif !@invitation.pending?
      redirect_to redirect_path, alert: 'Cette invitation a expiré'

    # If user signed in and his email is the invitation's one
    elsif user_signed_in? && current_user.email == @invitation.user_email
      @membership = TeamUserMembership.new(team: @invitation.team, user: current_user)
      if @membership.save
        @invitation.update(status: :accepted)
        redirect_to manager_root_path, notice: "Vous avez rejoint l'équipe #{@invitation.team.name}"
      else
        redirect_to manager_root_path, alert: @membership.errors.full_messages
      end

    # If user signed in but his email doesn't match
    elsif user_signed_in? && current_user.email != @invitation.user_email
      redirect_to manager_root_path, alert: "Cette invitation n'est pas destinée à l'utilisateur connecté"

    # If user not signed in
    elsif !user_signed_in?
      authenticate_user!
    end
  end

  def decline

    # If doesn't exist
    if @invitation.nil?
      redirect_to redirect_path, alert: "Cette invitation n'existe pas"

      # If not pending
    elsif !@invitation.pending?
      redirect_to redirect_path, alert: 'Cette invitation a expiré'

      # If user signed in and his email is the invitation's one
    elsif user_signed_in? && current_user.email == @invitation.user_email
      if @invitation.update(status: :declined)
        redirect_to manager_root_path, notice: "Vous avez décliné l'invitation de l'équipe #{@invitation.team.name}"
      else
        redirect_to manager_root_path, alert: @invitation.errors.full_messages
      end

      # If user signed in but his email doesn't match
    elsif user_signed_in? && current_user.email != @invitation.user_email
      redirect_to manager_root_path, alert: "Cette invitation n'est pas destinée à l'utilisateur connecté"

      # If user not signed in
    elsif !user_signed_in?
      authenticate_user!
    end
  end

  private
  def set_invitation_by_code
    @invitation = TeamUserMembershipInvitation.find_by(code: params[:id])
  end

  def redirect_path
    user_signed_in? ? manager_root_path : root_path
  end
end
