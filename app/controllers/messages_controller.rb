class MessagesController < ApplicationController
  def create
    @room = RoomUser.find_by(user_id: current_user.id)
    @message = Message.create!(params.require(:message).permit(:content, :image).merge(room_id: @room.room_id, user_id: current_user.id))
    ActionCable.server.broadcast 'room_channel', message: @message.template
  end
end
