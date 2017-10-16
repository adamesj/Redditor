class UsersController < ApplicationController
  before_action :require_same_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have registered."
      redirect_to root_path
    else
      flash[:error] = "We were unable to create an account."
      render :new
    end
  end

  def edit; end

  def update
    @user.update_attributes(user_params)
    if @user.save
      flash[:notice] = "Your profile has been updated."
      redirect_to user_path(@user)
    else
      flash[:error] = "Something went wrong."
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :phone, :time_zone)
  end

  def require_same_user
    if current_user != @user
      flash[:error] = "You don't have permission for that action!"
      redirect_to root_path
    end
  end
end