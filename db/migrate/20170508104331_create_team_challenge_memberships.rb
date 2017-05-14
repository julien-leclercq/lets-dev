class CreateTeamChallengeMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :team_challenge_memberships do |t|
      t.belongs_to :team, foreign_key: true
      t.belongs_to :challenge, foreign_key: true

      t.timestamps
    end
  end
end
