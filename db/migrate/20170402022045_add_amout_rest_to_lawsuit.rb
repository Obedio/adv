class AddAmoutRestToLawsuit < ActiveRecord::Migration[5.0]
  def change
    add_column :lawsuits, :amount_rest, :float
  end
end
