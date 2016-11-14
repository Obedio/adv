class RemoveRefFromLawsuit < ActiveRecord::Migration[5.0]
  def change
    remove_column :lawsuits, :account_id, :integer
  end
end
