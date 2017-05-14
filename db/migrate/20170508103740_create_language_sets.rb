class CreateLanguageSets < ActiveRecord::Migration[5.0]
  def change
    create_table :language_sets do |t|
      t.string :name

      t.timestamps
    end
  end
end
