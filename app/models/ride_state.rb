class RideState
  def self.progress(ride, driver)
    if ride.status == "active"
      ride.driver_id = driver.id
      ride.status = "accepted"
      ride.accepted_time = DateTime.now
      ride.save
    elsif ride.status == "accepted"
      ride.status = "picked up"
      ride.pickup_time = DateTime.now
      ride.save
    elsif ride.status == "picked up"
      ride.status = "completed"
      ride.dropoff_time = DateTime.now
      ride.save
    end
  end

  def self.progress_link(status)
    if status == "accepted"
      "mark as 'picked up'"
    elsif status == "picked up"
      "mark as 'completed'"
    end
  end

end
