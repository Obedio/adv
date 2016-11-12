class AddAddresstypeToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :addresstype, :string
  end
end
