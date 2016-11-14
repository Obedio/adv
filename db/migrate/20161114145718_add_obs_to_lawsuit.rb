class AddObsToLawsuit < ActiveRecord::Migration[5.0]
  def change
    add_column :lawsuits, :obs, :text
  end
end
