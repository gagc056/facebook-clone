# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
    @friendship = Friendship.new
  end

  def show
    @user = User.find(params[:id])
  end

  def friends
    @friends = current_user.friends
  end
end
