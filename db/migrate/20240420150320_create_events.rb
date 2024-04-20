class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.integer :min_quantity
      t.integer :max_quantity
      t.integer :duration
      t.text :menu
      t.boolean :alcoholic_drink
      t.boolean :party_decoration
      t.boolean :valet_service
      t.references :buffet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
