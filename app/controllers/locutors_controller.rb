class LocutorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversation = Conversation.find(params[:conversation_id])
    @locutors = @conversation.locutors

    render json: { locutors: @locutors }
  end

  private

  def locutor_params
    params.require(:locutor).permit(:user_id, :conversation_id)
  end
end
