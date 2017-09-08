class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.text :country
      t.text :zip
      t.text :city
      t.text :phone
      t.text :fullname
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
