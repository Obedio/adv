class RemoveAddrestypeFromClient < ActiveRecord::Migration[5.0]
  def change
    remove_column :clients, :addresstype_id, :string
  end
end
