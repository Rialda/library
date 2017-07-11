class AddIsguestToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :isguest, :bool, :default=>true
  end
end
