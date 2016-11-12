class RemoveAddresstypeFromAddress < ActiveRecord::Migration[5.0]
  def change
    remove_column :addresses, :addresstype_id, :string
  end
end
