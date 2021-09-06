class Booking < ApplicationRecord
  validates :guest_id, {presence: true}
  validates :room_id, {presence: true}  
  validates :checkin, {presence: true}
  validates :checkout, {presence: true}
  validates :count_guest, numericality: {greater_than: 0}
  validates :total_amount, {presence: true}

  validate :start_end_check

  def start_end_check
    errors.add(:checkout,"は開始日より前の日付は登録できません。") unless
    self.checkin < self.checkout 
    end
  end

