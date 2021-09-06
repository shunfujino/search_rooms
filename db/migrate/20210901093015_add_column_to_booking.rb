class AddColumnToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :Bookings, :checkin, :date
    add_column :Bookings, :checkout, :date
    add_column :Bookings, :count_guest, :integer
    
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
