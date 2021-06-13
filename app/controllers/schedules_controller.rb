class SchedulesController < ApplicationController
  before_action :params_current_room

  def new
    @schedule = Schedule.new
  end

  def create
    @room = RoomUser.find_by(user_id: current_user.id)
    @schedule = Schedule.new(params.require(:schedule).permit(:date, :detail).merge(room_id: @room.room_id,))
    if @schedule.valid?
      @schedule.save
      redirect_to schedule_room_path(current_user.id)
    else
      render 'new'
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    @schedule.update(params.require(:schedule).permit(:date, :detail))
    redirect_to schedule_room_path(@room.id)
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to schedule_room_path(@room.id)
  end

  private

  def params_current_room
    @roomuser = RoomUser.find_by(user_id: current_user.id)
    @room = Room.find(@roomuser.room_id)
  end

end
