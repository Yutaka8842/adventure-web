class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
    @roomuser = RoomUser.find_by(user_id: current_user.id)
    @room = Room.find(@roomuser.room_id)
  end

  def create
    @room = RoomUser.find_by(user_id: current_user.id)
    Schedule.create!(params.require(:schedule).permit(:date, :detail).merge(room_id: @room.room_id,))
    redirect_to schedule_room_path(current_user.id)
  end
end
