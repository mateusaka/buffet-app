class AddCpfToClients < ActiveRecord::Migration[7.1]
  def change
    add_column :clients, :cpf, :string
  end
end
