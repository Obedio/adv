class AddAddressTypeToClient < ActiveRecord::Migration[5.0]
  def change
    add_reference :clients, :addresstype, foreign_key: true
  end
end
