class MessagesController < ApplicationController
  def create
    @room = RoomUser.find_by(user_id: current_user.id)
    @message = Message.new(params.require(:message).permit(:content, :image).merge(room_id: @room.room_id, user_id: current_user.id))
    if @message.valid?
      @message.save
      redirect_to chatroom_room_path(current_user.id)
    end
  end
end
