class UsersController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @users = User.all

    render json: UserSerializer.new(@users).serializable_hash[:data], status: :ok
  end

  def show
    @user = User.find(params[:id])
    @users = User.all_except(current_user)
    @room = Room.new
    @rooms = Room.public_rooms
    @private_rooms = Room.private_rooms
    #@room_name = get_name(@user, current_user)
    #@single_room = Room.where(name: @room_name).first || Room.create_private_room([@user, current_user], @room_name)  
 
    @message = Message.new
    #@messages = @single_room.messages.order(created_at: :asc)
    #@messages_private = @private_rooms.messages.order(created_at: :asc)

    render json: {
      user: UserSerializer.new(@user).serializable_hash[:data][:attributes],
      users: @users.as_json(only: [:id, :email]),
      rooms: @rooms.as_json(include: [:messages]), 
      single_room: @single_room.as_json(include: [:messages]),
      room_name: @room_name.as_json,
      private_rooms: @private_rooms.as_json(include: [:messages]),
      #messages_private: @message_private.as_json,
    }, status: :ok
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: UserSerializer.new(@user).serializable_hash[:data][:attributes], status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    
    if current_user.admin?
      @user = User.find_by(id: params[:id])

      if @user.update(user_params)
        render json: UserSerializer.new(@user).serializable_hash[:data][:attributes], status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      render json: { message: 'You are not authorized to perform this action' }, status: :unauthorized
    end
  end

  def destroy
    user = User.find_by(id: params[:id])

    if user.nil?
      render status: 404, json: { error: 'User not found' }.to_json
    else
      user.destroy
      render json: { message: 'User deleted' }.to_json
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :is_enabled, :role, :password)
  end

  def get_name(user1, user2)
    user = [user1, user2].sort
    "private_#{user[0].id}_#{user[1].id}"
  end

end
