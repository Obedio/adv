class RemoveInfosToUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :birth, :date
    remove_column :users, :sex, :string
    remove_reference :users, :office, foreign_key: true
  end
end
