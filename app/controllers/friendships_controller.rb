# frozen_string_literal: true

class FriendshipsController < ApplicationController


  def new
    @friendship = Friendship.new
  end

  def create
    @friend = User.find(frienship_params[:friend_id])
    @user = current_user
    @friendship = @user.friendships.build(friend_id: @friend.id)
    @inverse_friendship = @friend.inverse_friendships.build(user_id: @user.id)
    if @friendship.save && @inverse_friendship
      flash[:success] = 'your friend request was send it '
    else
      flash[:error] = 'you canot send a friend request'
    end
    redirect_to notifications_path
  end

  def show
    @friendship = Friendship.find(1)
  end

  def index
    @friendship_request = current_user.friendship_request
    @pending_friends = current_user.pending_friends
  end

  def edit
    @friendship = Friendship.find(params[:id])
  end

  def update
    @friend = User.find(params[:id])
    @friendship = current_user.inverse_friendships.find_by(user_id: @friend.id)
    @inverse_friendship = @friend.friendships.find_by(friend_id: current_user.id)

    @friendship.update(status:true)
    @inverse_friendship.update(status:true)


    if @friendship.save && @inverse_friendship 
      flash[:success] = 'your have a new friend '
    else
      flash[:error] = 'error, try again'
    end
    redirect_to notifications_path
  end

  private

  def frienship_params
    params.require(:friendship).permit(:friend_id)
  end

  def frienship_status
    params.require(:friendship).permit(:status)
  end

end