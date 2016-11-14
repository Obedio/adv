class RemoveAmountFromLawsuit < ActiveRecord::Migration[5.0]
  def change
    remove_column :lawsuits, :amount, :float
  end
end
