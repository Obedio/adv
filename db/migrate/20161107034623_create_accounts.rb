class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.float :amount
      t.float :amount_paid
      t.integer :payday
      t.references :lawsuit, foreign_key: true
      t.references :client, foreign_key: true
      t.references :user, foreign_key: true
      t.references :statuspayment, foreign_key: true

      t.timestamps
    end
  end
end
