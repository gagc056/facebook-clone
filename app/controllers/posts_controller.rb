class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  
  end

  def create
    @user = User.find_by(id: current_user.id)
    @post = @user.post.build(post_params)
    if @post.save
      flash[:success] = "Post created"
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
    params.require(:post).permit(:content)
  end

end
