class RidersController < ApplicationController

  def new
    @rider = User.new
  end

  def create
    rider = User.new(rider_params)
    rider.role = "rider"
    if rider.save
      session[:user_id] = rider.id
      redirect_to rider_path(rider)
    else
      flash.now[:notice] = rider.errors.full_messages
      render :new
    end
  end

  private

  def rider_params
    params.require(:user).permit(:name, :email, :phone_number, :password)
  end
end
