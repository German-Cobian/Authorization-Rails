class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = Conversation.all

    render json: { conversations: @conversations }
  end

  def show
    @conversation = Conversation.find(params[:id])

    render json: { conversation: @conversation }
  end

  def create
    # Fetch the users
    user_1 = current_user
    user_2 = User.find(params[:conversation][:user_id])

    # Create a conversation with a title based on the usernames
    @conversation = Conversation.new(title: "#{user_1.username} & #{user_2.username}", user: user_1)

    # Build locutors for the conversation
    @conversation.locutors.build(user: user_1)
    @conversation.locutors.build(user: user_2)

    if @conversation.save
      # Fetch the locutors after the conversation is saved
      locutor_1 = @conversation.locutors.find_by(user: user_1)
      locutor_2 = @conversation.locutors.find_by(user: user_2)

      render json: { conversation: @conversation, locutors: [locutor_1, locutor_2] }
    else
      render json: { error: 'Failed to create room', errors: @conversation.errors.full_messages }, status: :unprocessable_entity
    end
  end


  private

  def conversation_params
    params.require(:conversation).permit(:title, :user_id)
  end
end
