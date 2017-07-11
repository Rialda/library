class CreateSubcategories < ActiveRecord::Migration[5.0]
  def change
    create_table :subcategories do |t|
      t.text :subcategory_name
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
