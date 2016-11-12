class RemoveAddressIdFromAddress < ActiveRecord::Migration[5.0]
  def change
    remove_reference :addresses, :clien, foreign_key: true
  end
end
