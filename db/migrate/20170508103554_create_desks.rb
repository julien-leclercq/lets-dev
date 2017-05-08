class CreateDesks < ActiveRecord::Migration[5.0]
  def change
    create_table :desks do |t|
      t.datetime :started_at
      t.datetime :ended_at
      t.boolean :current

      t.timestamps
    end
  end
end
