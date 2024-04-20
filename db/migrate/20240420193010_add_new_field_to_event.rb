class AddNewFieldToEvent < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :local, :string
  end
end
