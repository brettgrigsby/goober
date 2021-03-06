class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :active_rides, :human_time, :home_page

  def current_user
    current_user ||= User.find_by(id: session[:user_id])
  end

  def active_rides(driver)
    Ride.where(status: "active").where("passenger_number <= ?", driver.passenger_cap)
  end

  def human_time(date_time)
    date_time.strftime("%m/%d/%y @ %I:%M %p")
  end

  def home_page(user)
    if user.role == "driver"
      driver_path(user)
    elsif user.role == "rider"
      rider_path(user)
    end
  end

end
