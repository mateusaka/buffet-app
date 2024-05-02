class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :client, null: false, foreign_key: true
      t.references :buffet, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.date :date
      t.integer :quantity
      t.text :details
      t.string :code
      t.string :status

      t.timestamps
    end
  end
end
