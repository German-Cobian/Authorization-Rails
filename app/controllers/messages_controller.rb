class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user, only: [:create]

  def index
    @messages = Message.all

    render json: { messages: @messages }
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.build(message_params)
    @message.user = current_user
    
    if @message.save
      render json: { message: @message }
    else
      render json: { error: 'Failed to create message' }, status: :unprocessable_entity
    end
  end

private
  def message_params
    params.require(:message).permit(:body, :user_id, :room_id)
  end

  def authorize_user
    @room = Room.find(params[:room_id])
  
    if @room.is_private? && !@room.participants.exists?(user_id: current_user.id)
      render json: { error: 'You are not authorized to post messages in this private room' }, status: :forbidden
    end
  end
end
