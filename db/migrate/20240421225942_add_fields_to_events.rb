class AddFieldsToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :weekend_base_price, :decimal, precision: 10, scale: 2
    add_column :events, :weekend_additional_price_person, :decimal, precision: 10, scale: 2
    add_column :events, :weekend_additional_price_hour, :decimal, precision: 10, scale: 2
    add_column :events, :weekday_base_price, :decimal, precision: 10, scale: 2
    add_column :events, :weekday_additional_price_person, :decimal, precision: 10, scale: 2
    add_column :events, :weekday_additional_price_hour, :decimal, precision: 10, scale: 2
  end
end
