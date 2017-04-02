class AddAttachmentDocumentToAnnexes < ActiveRecord::Migration
  def self.up
    change_table :annexes do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :annexes, :document
  end
end
