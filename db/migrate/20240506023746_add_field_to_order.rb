class AddFieldToOrder < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :payment_validity, :date
  end
end
