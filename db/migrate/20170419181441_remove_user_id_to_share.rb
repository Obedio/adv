class RemoveUserIdToShare < ActiveRecord::Migration[5.0]
  def change
    remove_reference :shares, :user, foreign_key: true
  end
end
