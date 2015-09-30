require 'rails_helper'

describe 'user rides', type: :integration do
  it 'can be returned for a rider' do
    rider = User.create(name: "Brett", email: "test@test.com", phone_number: "1234567890", password: "password", role: "rider")
    ride = Ride.create(pickup: "some place", dropoff: "some other place", passenger_number: 3, rider_id: rider.id)

    expect(rider.rides.first).to eq(ride)
  end

  it 'can be returned for a driver' do
    driver = User.create(name: "Brett", 
                         email: "test@test.com", 
                         phone_number: "1234567890", 
                         password: "password", 
                         role: "driver",
                         car_make: "Testla",
                         car_model: "Nodester",
                         passenger_cap: 3)
    ride = Ride.create(pickup: "some place", dropoff: "some other place", passenger_number: 3, rider_id: 1, driver_id: driver.id)

    expect(driver.rides.first).to eq(ride)
  end
end
