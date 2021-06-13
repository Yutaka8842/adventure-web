class UsersController < ApplicationController
  before_action :params_current_room
  def show
    @user = User.find(params[:id])
  end

  
private
  def params_current_room
    @roomuser = RoomUser.find_by(user_id: current_user.id)
    @room = Room.find(@roomuser.room_id)
  end
end
