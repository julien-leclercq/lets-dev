class CreateJuryChallengeMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :jury_challenge_memberships do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :challenge, foreign_key: true

      t.timestamps
    end
  end
end
