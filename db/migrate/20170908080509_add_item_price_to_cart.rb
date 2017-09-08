class AddItemPriceToCart < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :item_price, :numeric
  end
end
