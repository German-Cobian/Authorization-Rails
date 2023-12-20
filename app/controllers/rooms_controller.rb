class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @room = Room.new # For the input bar to link to the create Room action
    @rooms = Room.public_rooms
    @users = User.all_except(current_user)

    render json: { room: @room, rooms: @rooms, users: @users }
  end

  def show
    @single_room = Room.find(params[:id])
    @messages = @single_room.messages

    render json: { messages: @messages }
  end

  def create
    @room = Room.create(room_params)
    render json: { room: @room }
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end