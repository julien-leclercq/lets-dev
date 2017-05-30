class CreateTeamUserMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :team_user_memberships do |t|
      t.belongs_to :team
      t.belongs_to :user
      t.integer :role
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
