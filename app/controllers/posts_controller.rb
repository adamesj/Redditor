class PostsController < ApplicationController
  before_action :require_user, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user
    if @post.save
      flash[:notice] = "You've created a new post!"
      redirect_to posts_path
    else
      flash[:error] = "Something went wrong, please check the error message."
      render :new
    end
  end

  def edit; end

  def update
    if @post.update_attribtues(post_params)
      flash[:notice] = "Your post has been updated!"
      redirect_to post_path(post)
    else
      flash[:error] = "Something went wrong, please check the error message."
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "Your post has been deleted."
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :url, category_ids: [])
  end
end