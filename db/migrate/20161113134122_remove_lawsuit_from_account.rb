class RemoveLawsuitFromAccount < ActiveRecord::Migration[5.0]
  def change
    remove_column :accounts, :lawsuit_id, :integer
  end
end
