class AddAmountToLawsuit < ActiveRecord::Migration[5.0]
  def change
    add_column :lawsuits, :amount, :float
    add_column :lawsuits, :amount_paid, :float
  end
end
