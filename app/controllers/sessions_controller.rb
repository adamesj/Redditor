class SessionsController < ApplicationController
  def new
  end

  def create
    # user.authenticate('password')
    # get the user obj
    # see if password matches
    # if so, authenticate user
    # if not, error message
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back!"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong."
      redirect_to register_path
    end
  end

  def delete
    session[:user_id] = nil
    flash[:notice] = "You've logged out!"
    redirect_to root_path
  end
end