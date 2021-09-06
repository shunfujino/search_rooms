class RenameHotelNameColumnToHotels < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :hotel_name, :room_name
    rename_column :rooms, :hotel_info, :room_info
    rename_column :rooms, :hotel_photo, :room_photo
  end
end
