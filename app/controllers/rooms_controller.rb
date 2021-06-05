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

  def edit
    @roomuser = RoomUser.find_by(user_id: current_user.id)
    @room = Room.find(@roomuser.room_id)
  end

  def update
    @roomuser = RoomUser.find_by(user_id: current_user.id)
    @room = Room.find(@roomuser.room_id)
    if @room.update(room_update_params)
      redirect_to chatroom_room_path
    else
      render 'edit'
    end
  end

  def destroy
    @roomuser = RoomUser.find_by(user_id: current_user.id)
    @room = Room.find(@roomuser.room_id)
    @room.destroy
    redirect_to root_path
  end

  def exit
    @roomuser = RoomUser.find_by(user_id: current_user.id)
    @roomuser.destroy
    redirect_to root_path
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

  def room_update_params
    params.require(:room).permit(:title, :category, :capacity, :overview, :budget, :details)
  end


end
