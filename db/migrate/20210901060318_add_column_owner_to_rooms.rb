class AddColumnOwnerToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :Rooms, :owner_id, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
