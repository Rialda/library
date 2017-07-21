class Item < ApplicationRecord
  has_attached_file :image, styles: { medium: "350x400"}
validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

has_attached_file :document
validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

  belongs_to :category
  belongs_to :subcategory
  belongs_to :tag
  belongs_to :language

  def self.search(search)
  if search
    where('item_name LIKE ?', "%#{search}%")

  else
    where(nil)
  end
end

end
