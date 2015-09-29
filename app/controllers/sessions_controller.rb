class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "#{user.name} successfully logged in!"
      user.driver? ? redirect_to(driver_path(user)) : redirect_to(rider_path(user))
    else
      flash.now[:notice] = "Invalid Log In"
      render :new
    end
  end
  
  def destroy
    session.clear
    redirect_to root_path
  end
end
