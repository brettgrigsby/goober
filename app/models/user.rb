require_relative "ride_finder"

class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :name, :phone_number
  validates :email, presence: true, uniqueness: true
  validates :car_make, presence: true, if: :driver?
  validates :car_model, presence: true, if: :driver?
  validates :passenger_cap, presence: true, if: :driver?

  def driver?
    role == "driver"
  end

  def current_ride
    current_ride ||= rides.where.not(status: "completed").first
  end

  def rides
    RideFinder.grab(role, id)
  end

  def completed_rides
    rides.where(status: "completed")
  end
end
