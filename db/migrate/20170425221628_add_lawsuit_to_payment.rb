class AddLawsuitToPayment < ActiveRecord::Migration[5.0]
  def change
    add_reference :payments, :lawsuit, foreign_key: true
  end
end
