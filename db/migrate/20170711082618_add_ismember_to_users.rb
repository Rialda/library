class AddIsmemberToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :ismember, :bool, :default=>false
  end
end
