class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :last_name
      t.date :birth
      t.string :sex
      t.references :user, foreign_key: true
      t.references :office, foreign_key: true

      t.timestamps
    end
  end
end
