class AddFieldsToOrder < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :payment_method, :string
    add_column :orders, :extra_fee, :decimal, precision: 10, scale: 2
    add_column :orders, :discount, :decimal, precision: 10, scale: 2
    add_column :orders, :fee_or_discount_reason, :text
  end
end
