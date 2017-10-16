class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.creator = current_user
    if @comment.save
      flash[:notice] = "Your comment was successfully saved!"
      redirect_to post_path(@post)
    else
      flash[:error] = "We could not save your comment."
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end