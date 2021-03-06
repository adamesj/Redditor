class CommentsController < ApplicationController
  before_action :require_user

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

  def vote
    @comment = Comment.find(params[:id])
    @vote = Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])
    if @vote.valid?
      flash[:notice] = "Your vote has been counted!"
    else
      flash[:error] = "Your vote was not counted!"
    end
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end