class Ride < ActiveRecord::Base
  validates_presence_of :pickup, :dropoff, :rider_id, :passenger_number

  def progress_link
    RideState.progress_link(status)
  end

  def rider
    User.find(rider_id)
  end

  def driver
    User.find(driver_id)
  end

  def cost
    ((((dropoff_time - pickup_time) / 60) / 3) * 2).round(2)
  end
end
