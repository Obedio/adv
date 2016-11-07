class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.float :amount
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
