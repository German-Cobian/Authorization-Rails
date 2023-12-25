class ParticipantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_host, only: [:create]

  def index
    @room_instance = Room.find(params[:room_id])
    @participants = @room_instance.participants

    render json: { participants: @participants }
  end
 
  def create
    @room = Room.find(params[:room_id])
    @user = User.find(participant_params[:user_id])
    @participant = @room.participants.build(user: @user)

    if @participant.save
      render json: { participant: @participant }
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end


  private

  def participant_params
    params.require(:participant).permit(:user_id, :room_id)
  end

  def authorize_host
    @room = Room.find(params[:room_id])

    if @room.is_private? && @room.host != current_user
      render json: { error: 'You are not authorized to add participants to this room' }, status: :forbidden
    end
  end
end
