class RideFinder
  def self.grab(role, user_id)
    if role == "rider"
      Ride.where(rider_id: user_id)
    elsif role == "driver"
      Ride.where(driver_id: user_id)
    end
  end
end

