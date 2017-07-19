class Item < ApplicationRecord
  has_attached_file :image, styles: { medium: "350x400"}
validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :category
  belongs_to :subcategory
  belongs_to :tag
  belongs_to :language
end
