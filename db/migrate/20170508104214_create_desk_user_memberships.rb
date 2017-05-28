class CreateDeskUserMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :desk_user_memberships do |t|
      t.belongs_to :desk
      t.belongs_to :user

      t.timestamps
    end
  end
end
