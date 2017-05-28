class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :financial_movement
      t.belongs_to :user

      t.timestamps
    end
  end
end
