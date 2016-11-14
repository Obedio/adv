class RemovePaydayFromAccount < ActiveRecord::Migration[5.0]
  def change
    remove_column :accounts, :payday, :integer
  end
end
