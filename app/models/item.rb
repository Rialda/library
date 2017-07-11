class Item < ApplicationRecord
  belongs_to :category
  belongs_to :subcategory
  belongs_to :tag
  belongs_to :language
end
