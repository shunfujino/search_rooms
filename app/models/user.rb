class User < ApplicationRecord
  has_secure_password
  validates :user_name, presence: true
  validates :email,{presence: true, uniqueness: true}
  validates :user_info, {presence: true ,on: :update}

  # 所有している部屋
  def owns
    return Room.where(owner_id: self.id)
  end

  #予約している部屋
  def reserved_rooms
    return Booking.where(guest_id: self.id)
  end
end
