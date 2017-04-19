class AddEmailToShare < ActiveRecord::Migration[5.0]
  def change
    add_column :shares, :email, :string
  end
end
