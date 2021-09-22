class RoomsController < ApplicationController
  def top
  end

  def new
    @room = Room.new
  end

  def show
    @room = Room.find_by(id: params[:id])
    @booking = Booking.new
  end

  def create
    @current_user = User.find_by(id: params[:owner_id])
    @room = Room.new(room_name: params[:room_name], address: params[:address], room_info: params[:room_info],price: params[:price], room_photo: params[:room_photo], owner_id: params[:owner_id])    

    if @room.save
      if params[:room_photo]
        @room.room_photo = "#{@room.id}.jpg"
        image = params[:room_photo]
        File.binwrite("public/room_photos/#{@room.room_photo}", image.read)
      end
      @room.save
      flash[:notice]="部屋を登録しました。"
      redirect_to("/rooms/#{@room.id}")
    else
      render("rooms/new")
    end
  end
end