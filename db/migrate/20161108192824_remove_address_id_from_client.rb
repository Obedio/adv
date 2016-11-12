class RemoveAddressIdFromClient < ActiveRecord::Migration[5.0]
  def change
    remove_reference :clients, :address, foreign_key: true
  end
end
