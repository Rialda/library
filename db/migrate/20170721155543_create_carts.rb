class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.integer :line_no
      t.numeric :total
      t.numeric :shipping
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
