# frozen_string_literal: true

class FriendshipsController < ApplicationController
  before_action :friendship_exists, only: [:new, :create]

  def new
    @friendship = Friendship.new
  end

  def create
    @friend = User.find(frienship_params[:friend_id])
    @user = current_user
    @friendship = @user.friendships.build(friend_id: @friend.id)
    @inverse_friendship = @friend.inverse_friendships.build(user_id: @user.id)
    if @friend == @user
      flash[:error] = 'you cannot send a friend request to yourself'
    elsif @friendship.save && @inverse_friendship
      flash[:success] = 'your friend request was send it '
    else
      flash[:error] = 'you cannot send a friend request'
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

    @friendship.update(status: true)
    @inverse_friendship.update(status: true)

    if @friendship.save && @inverse_friendship
      flash[:success] = "#{@friend.first_name} and you are friends!"
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

  def friendship_exists
    @friend = User.find(frienship_params[:friend_id])
    @user = current_user

    @friendship = current_user.inverse_friendships.find_by(user_id: @friend.id, friend_id: current_user.id)
    @inverse_friendship = @friend.friendships.find_by(user_id: @friend.id, friend_id: current_user.id)

    unless @friendship.nil? && @inverse_friendship.nil?
      flash[:error] = "You can`t send a friendship request to #{@friend.first_name}"
      redirect_to users_path
    end
  end
end
