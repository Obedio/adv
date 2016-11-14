class AddAccountToLawsuit < ActiveRecord::Migration[5.0]
  def change
    add_reference :lawsuits, :account, foreign_key: true
  end
end
