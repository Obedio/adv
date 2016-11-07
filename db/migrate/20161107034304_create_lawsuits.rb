class CreateLawsuits < ActiveRecord::Migration[5.0]
  def change
    create_table :lawsuits do |t|
      t.string :number
      t.date :assessment
      t.text :description
      t.float :amount
      t.references :user, foreign_key: true
      t.references :client, foreign_key: true
      t.references :venue, foreign_key: true
      t.references :kind, foreign_key: true
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
