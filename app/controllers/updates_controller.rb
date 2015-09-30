class UpdatesController < ApplicationController

  def show
    ride = Ride.find(params[:id])

    render json: {status: ride.status}                
  end

  def update
    ride = Ride.find(params[:id])

    render partial: "shared/rider_active_ride"
  end
end
