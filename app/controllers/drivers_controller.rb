class DriversController < ApplicationController

  def new
    @driver = User.new
  end

  def create
    driver = User.new(driver_params)
    driver.role = "driver"
    if driver.save
      session[:user_id] = driver.id
      redirect_to driver_path(driver)
    else
      flash.now[:notice] = driver.errors.full_messages
      render :new
    end
  end

  def show
    
  end

  private

  def driver_params
    params.require(:user).permit(:name, :email, :phone_number, :password, :car_make, :car_model, :passenger_cap)
  end

end
