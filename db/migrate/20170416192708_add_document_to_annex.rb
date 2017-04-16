class AddDocumentToAnnex < ActiveRecord::Migration[5.0]
  def change
    add_column :annexes, :document, :string
  end
end
