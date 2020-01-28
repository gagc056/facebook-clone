# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :require_login, only: %i[new create]
  def index
    @posts = Post.all
    @feed = current_user.show_post
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find_by(id: current_user.id)
    @post = @user.posts.build(post_params)

    if @post.save
      flash[:success] = 'Post created'
      redirect_to posts_path
    else
      flash.now[:error] = "Post can't be created"
      render 'new'
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  private

  def post_params
    params.permit(:content)
  end

  def require_login
    return if current_user

    flash[:error] = 'You need to login'
    redirect_to user_session_path
  end
end
