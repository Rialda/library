class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.text :language_name

      t.timestamps
    end
  end
end
