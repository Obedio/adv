class AddLastnameToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :lastname, :string
  end
end
