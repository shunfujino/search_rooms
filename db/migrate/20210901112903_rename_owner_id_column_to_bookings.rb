class RenameOwnerIdColumnToBookings < ActiveRecord::Migration[6.1]
  def change
    rename_column :Bookings, :owner_id, :guest_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
