class CreateJuryChallengeMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :jury_challenge_memberships do |t|
      t.belongs_to :user
      t.belongs_to :challenge

      t.timestamps
    end
  end
end
