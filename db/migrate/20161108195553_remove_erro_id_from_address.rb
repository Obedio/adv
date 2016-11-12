class RemoveErroIdFromAddress < ActiveRecord::Migration[5.0]
  def change
    remove_column :addresses, :cliente_id, :string
  end
end
