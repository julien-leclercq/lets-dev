class CreateTeamUserMembershipInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :team_user_membership_invitations do |t|
      t.belongs_to :team
      t.string :user_email
      t.string :code
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
