class CreateAnnexes < ActiveRecord::Migration[5.0]
  def change
    create_table :annexes do |t|
      t.text :description
      t.references :lawsuit, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
