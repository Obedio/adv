class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.date :born
      t.string :sex
      t.string :cpf
      t.string :rg
      t.string :email
      t.string :telephone
      t.string :celphone
      t.text :bio
      t.references :address, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
