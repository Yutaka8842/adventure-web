class MessagesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @message = Message.new(params.require(:message).permit(:content, :image).merge(room_id: @room.id,user_id: current_user.id))
    if @message.valid?
      @message.save
      redirect_to chatroom_room_path(current_user.id)
    end
  end
end
