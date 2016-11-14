class AddLawIdToAccount < ActiveRecord::Migration[5.0]
  def change
    add_reference :accounts, :lawsuit, foreign_key: true
  end
end
