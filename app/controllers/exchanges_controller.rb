class ExchangesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user, only: [:create]

  def index
    @conversation = Conversation.find(params[:conversation_id])
    @exchanges = @conversation.exchanges
    #@exchanges = Exchange.all 

    render json: { exchanges: @exchanges }
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @exchange = @conversation.exchanges.build(exchange_params)
    @exchange.user = current_user
    
    if @exchange.save
      render json: { exchange: @exchange }
    else
      render json: { error: 'Failed to create message' }, status: :unprocessable_entity
    end
  end

private
  def exchange_params
    params.require(:exchange).permit(:body, :user_id, :conversation_id)
  end

  def authorize_user
    @conversation = Conversation.find(params[:conversation_id])
  
    if !@conversation.locutors.exists?(user_id: current_user.id)
      render json: { error: 'You are not authorized to post messages in this private room' }, status: :forbidden
    end
  end
end