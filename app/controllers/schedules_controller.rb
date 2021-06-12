class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
    @roomuser = RoomUser.find_by(user_id: current_user.id)
    @room = Room.find(@roomuser.room_id)
  end

  def create
    @schedule = Schedule.new
  end
end
