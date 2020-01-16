class CommentController < ApplicationController
    def  new
      @comment=Comment.new
    
    end

    def create
        @post=Post.find_by(id: params[:id])
        @comment=@post.comments.build(comment_params)
        if @comment.save
            flash[:success]='Your comment was successfully writted'
            redirect_to @post
        else
            flash.now[:error]='Your comment couldn´t be writted'
            render 'new'
        end

    end

    def  index
        @post=Post.find_by(id: params[:id])
        @comment=@post.comments.all(comment_params)
        if @comment.save
            flash[:success]='Your comment was successfully writted'
            redirect_to @post
        else
            flash.now[:error]='Your comment couldn´t be writted'
            render 'new'
        end
    end

    private

    def comment_params
      params.permit(:content)
    end
end
