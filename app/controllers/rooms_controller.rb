class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.all

    render json: { rooms: @rooms }
  end

  def show
    @room = Room.find(params[:id])

    render json: { room: @room }
  end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save
      # Automatically make the creator a participant
      @participant = @room.participants.create(user: current_user)

      render json: { room: @room, participant: @participant}
    else
      render json: { error: 'Failed to create room' }, status: :unprocessable_entity
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :user_id, :is_private)
  end
end
