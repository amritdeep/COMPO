class AddAttachmentDocumentToContents < ActiveRecord::Migration
  def self.up
    change_table :contents do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :contents, :document
  end
end
