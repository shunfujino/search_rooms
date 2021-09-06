class BookingsController < ApplicationController
  def new
    @room = Room.find_by(id: params[:room_id])
    @booking = Booking.new
    @stay = (Date.parse(params[:checkout]) - Date.parse(params[:checkin])).to_i
    @total_amount = @room.price.to_i * params[:count_guest].to_i * @stay
    render("bookings/confirmation")
  end

  #予約確認ページ
  def confirmation
    @room = Room.find_by(id: params[:room_id])
  end

  #予約を確定する
  def reservations
    @current_user = User.find_by(id: params[:guest_id])
    @room = Room.find_by(id: params[:room_id])
    @booking = Booking.new(guest_id: params[:guest_id], room_id: params[:room_id],count_guest:params[:count_guest], checkin: params[:checkin], checkout: params[:checkout], total_amount: params[:total_amount])
    if @booking.save
      @booking.save
      redirect_to "/users/reservations/#{@booking.id}"
    else
      flash[:notice] ="予約失敗"
      render("rooms/show")
    end
  end

  # 宿泊金額計算
  def calculation
    @result = @room.price * params[:count_guest] * (params[:checkout]- params[:checkin])
  end
end
