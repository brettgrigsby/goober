class RidesController < ApplicationController

  def new
    @ride = Ride.new
  end

  def create
    ride = Ride.new(ride_params)
    ride.rider_id = current_user.id
    ride.requested_time = DateTime.now
    if ride.save
      flash[:notice] = "New Ride Requested!"
      redirect_to rider_path(current_user)
    else
      flash[:notice] = ride.errors.full_messages
      redirect_to rider_path(current_user)
    end
  end

  def update
    ride = Ride.find(params[:id])
    RideState.progress(ride, current_user)
    redirect_to driver_path(current_user)
  end

  private

  def ride_params
    params.require(:ride).permit(:pickup, :dropoff, :passenger_number)
  end

end
