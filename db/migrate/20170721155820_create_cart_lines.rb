class CreateCartLines < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_lines do |t|
      t.integer :line_no
      t.numeric :single_price
      t.references :item, foreign_key: true
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
