class LikesController < ApplicationController

  before_action :find_like, only: [:destroy]

  def  new 
    @like = Like.new
  end
  def create
      @post=Post.find_by(id: params[:post_id])
      @like = @post.likes << current_user.likes.build
      redirect_to post_path(@post)
  end

  def destroy
    @like.destroy
    redirect_to @post
  end

  private

  def find_like
    @post=Post.find_by(id: params[:post_id])
    @like = @post.likes.find(params[:id])
  end 
end
