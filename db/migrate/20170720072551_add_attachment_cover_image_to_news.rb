class AddAttachmentCoverImageToNews < ActiveRecord::Migration
  def self.up
    change_table :news do |t|
      t.attachment :cover_image
    end
  end

  def self.down
    remove_attachment :news, :cover_image
  end
end
