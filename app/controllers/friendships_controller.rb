# frozen_string_literal: true

class FriendshipsController < ApplicationController


  def new
    @friendship = Friendship.new
  end

  def create
    @friend = User.find(frienship_params[:friend_id])
    @user = current_user
    @friendship = @friend.friendships.build(friend_id: @user.id)
    if @friendship.save
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
  end

  def edit
    @friendship = Friendship.find(params[:id])
  end

  def update
    @friend = User.find(params[:id])
    @friendship = current_user.friendships.where(user_id: current_user.id, friend_id: @friend.id)

    @friendship.update(status: !@friendship.status)
    if @friendship.save
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