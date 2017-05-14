class CreateDeskUserMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :desk_user_memberships do |t|
      t.belongs_to :desk, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
