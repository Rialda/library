class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.text :title
      t.text :author
      t.text :news_body

      t.timestamps
    end
  end
end
