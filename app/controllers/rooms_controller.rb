class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @room = Room.new # For the input bar to link to the create Room action
    @rooms = Room.public_rooms
    @users = User.all_except(current_user)


    render json: { room: @room, rooms: @rooms, users: @users }
  end

  def create
    @room = Room.create(room_params)
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end