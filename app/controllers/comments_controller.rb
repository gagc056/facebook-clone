class CommentsController < ApplicationController
  def  new
      
    @comment = Comment.new
  end
  def create
      @post=Post.find_by(id: 1)
      @comment = @post.comments << current_user.comments.build(comment_params)
      redirect_to post_path(@post)
  end
  def  index
      @post=Post.find_by(id: params[:id])
      @comments = @post.comments.all
  end

  private
  
  def comment_params
    params.permit(:content, :post_id)
  end
end