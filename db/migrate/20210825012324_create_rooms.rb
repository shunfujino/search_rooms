class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :hotel_name
      t.string :adress
      t.text :hotel_info
      t.integer :price
      t.string :hotel_photo

      t.timestamps
    end
  end
end
