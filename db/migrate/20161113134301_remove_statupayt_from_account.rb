class RemoveStatupaytFromAccount < ActiveRecord::Migration[5.0]
  def change
    remove_column :accounts, :statuspayment_id, :integer
  end
end
