class AddOnStackBuyToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :on_stack_buy, :integer
  end
end
