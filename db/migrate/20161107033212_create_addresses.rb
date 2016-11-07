class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :district
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.references :addresstype, foreign_key: true

      t.timestamps
    end
  end
end
