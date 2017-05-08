class CreateLanguageSetMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :language_set_memberships do |t|
      t.belongs_to :language, foreign_key: true
      t.belongs_to :language_set, foreign_key: true

      t.timestamps
    end
  end
end
