class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :params_current_room

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile, :icon])
  end

  def params_current_room
    @roomuser = RoomUser.find_by(user_id: current_user.id)
    @room = Room.find(@roomuser.room_id)
  end
end
