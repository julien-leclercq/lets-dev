class CreateFinancialMovements < ActiveRecord::Migration[5.0]
  def change
    create_table :financial_movements do |t|
      t.float :amount
      t.text :description

      t.belongs_to :user

      t.timestamps
    end
  end
end
