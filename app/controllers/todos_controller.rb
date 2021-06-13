class TodosController < ApplicationController
  before_action :params_current_room

  def new
    @todo = Todo.new
  end
  
  def create
    @schedule
    @todo = Todo.find(params[:id])
    Todo.create!(params.require(:todo).permit(:date, :detail).merge(schedule_id: @todo.room_id))
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
  end

  def destroy
    @todo = Todo.find(params[:id])
  end


  private
  
  def params_current_room
    @roomuser = RoomUser.find_by(user_id: current_user.id)
    @room = Room.find(@roomuser.room_id)
  end

end
