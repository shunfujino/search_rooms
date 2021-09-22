class Room < ApplicationRecord
  validates :room_name, :address, :room_info, :price, :room_photo, :owner_id, presence: true

end
