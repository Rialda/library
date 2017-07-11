class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.text :item_name
      t.text :author
      t.text :edition
      t.integer :year_published
      t.text :publisher
      t.bigint :isbn
      t.integer :on_stack
      t.numeric :price
      t.text :description
      t.references :category, foreign_key: true
      t.references :subcategory, foreign_key: true
      t.references :tag, foreign_key: true
      t.references :language, foreign_key: true
      t.boolean :borrow
      t.boolean :buy

      t.timestamps
    end
  end
end
