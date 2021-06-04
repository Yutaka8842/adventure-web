class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
      @room = Room.new(room_params)
    if @room.valid?
        @room.save
        redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def join
    @room = Room.find(params[:id])
    if RoomUser.create(room_id: @room.id, user_id: current_user.id)
      redirect_to chatroom_room_path
    else
      redirect_to room_path
    end
  end

  def mypage
    @user = User.find(current_user.id)
  end

  def chatroom
    if RoomUser.find_by(user_id: current_user.id).present?
      @message = Message.new
      @roomuser = RoomUser.find_by(user_id: current_user.id)
      @room = Room.find(@roomuser.room_id)
      @messages = @room.messages.includes(:user)
    else
      redirect_to blankroom_room_path
    end
  end

  def blankroom
  end

  def roomsearch
    @rooms = Room.all
  end

  def todo

  end

  def schedule
  end

  def gallery
  end

  private

  def room_params
    params.require(:room).permit(:title, :category, :capacity, :overview, :budget, :details, user_ids: []).merge(leader: current_user.id)
  end


end
