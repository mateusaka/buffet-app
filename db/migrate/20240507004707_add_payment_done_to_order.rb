class AddPaymentDoneToOrder < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :payment_done, :boolean
  end
end
