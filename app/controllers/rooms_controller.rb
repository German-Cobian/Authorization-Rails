class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @room = Room.new # For the input bar to link to the create Room action
    @rooms = Room.public_rooms
    @users = User.all_except(current_user)

    render json: { room: @room, rooms: @rooms, users: @users }
  end

  def show
    @room_instance = Room.find(params[:id])
    @messages = @room_instance.messages

    render json: { messages: @messages }
  end

  def create
    # @room = Room.create(room_params)
    # render json: { room: @room }

    @room = current_user.rooms.build(room_params) # allows current user to register as participant simultaneously as creating room

    if @room.save
      # Automatically make the creator a participant
      @participant = @room.participants.create(user: current_user)

      render json: { room: @room, participant: @participant }
    else
      render json: { error: 'Failed to create room' }, status: :unprocessable_entity
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :user_id, :is_private)
  end
end