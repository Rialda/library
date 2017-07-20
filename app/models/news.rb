class News < ApplicationRecord
    include Bootsy::Container
  has_attached_file :cover_image, styles: { medium: "500x500"}
  validates_attachment_content_type :cover_image, content_type: /\Aimage\/.*\z/
end
