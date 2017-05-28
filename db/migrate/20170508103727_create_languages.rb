class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :language do |t|
      t.string :name
      t.text :description
      t.string :documentation_url

      t.attachment :logo

      t.timestamps
    end

  end
end
