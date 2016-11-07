class CreateDataUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :data_users do |t|
      t.string :name
      t.date :born
      t.string :sex
      t.references :office, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
