class AddFullnameToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :fullname, :text
  end
end
