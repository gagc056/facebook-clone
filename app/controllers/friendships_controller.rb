# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
    @user = current_user
    @friendship = @user.friendships.build(friendship_params)
    if @friendship.save
      flash[:success] = 'your friend request was send it '
    else
      flash[:error] = 'you canot send a friend request'
    end
    redirect_to notification_path
  end

  def show
    @friendship = Friendship.find(params[:id])
  end

  def index
    @friendships = Friendship.all
  end

  def edit
    @friendship = Friendship.find(params[:id])
  end

  def update
    @friendship = friendship.find(params[:friendship_id])
    @friendship.status.update(status: params[:status])
    if @friendship.save
      flash[:success] = 'your have a new friend '
    else
      flash[:error] = 'error, try again'
    end
    redirect_to notification_path
  end
end
