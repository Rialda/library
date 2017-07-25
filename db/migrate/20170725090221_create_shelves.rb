class CreateShelves < ActiveRecord::Migration[5.0]
  def change
    create_table :shelves do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.boolean :reserved, default: false
      t.boolean :borrowed, default: false

      t.timestamps
    end
  end
end
