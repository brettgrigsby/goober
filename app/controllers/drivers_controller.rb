class DriversController < ApplicationController
  before_action :check_driver, only: [:show]

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

  def check_driver
    redirect_to root_path unless current_user && current_user.driver?
  end
end
