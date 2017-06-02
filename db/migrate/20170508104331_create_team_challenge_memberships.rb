class CreateTeamChallengeMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :team_challenge_memberships, id: :uuid do |t|
      t.belongs_to :team
      t.belongs_to :challenge

      t.timestamps
    end
  end
end
