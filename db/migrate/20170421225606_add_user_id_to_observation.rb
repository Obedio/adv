class AddUserIdToObservation < ActiveRecord::Migration[5.0]
  def change
    add_reference :observations, :user, foreign_key: true
  end
end
