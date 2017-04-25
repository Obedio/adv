class RemoveCityToVenue < ActiveRecord::Migration[5.0]
  def change
    remove_column :venues, :city, :string
  end
end
