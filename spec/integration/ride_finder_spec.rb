require 'rails_helper'

RSpec.describe RideFinder, type: :integration do

  before(:each) do
    driver = User.create(name: "Ted", 
                         email: "ted@ted.com", 
                         phone_number: "1234567890", 
                         password: "password", 
                         role: "driver", 
                         car_make: "Testla", 
                         car_model: "Nodester", 
                         passenger_cap: 5)
    Ride.create(pickup: "somewhere", dropoff: "another place", passenger_number: 2)
    Ride.create(pickup: "somewhere", dropoff: "another place", passenger_number: 2)
  end 

  xit "progesses an active ride" do
    RideState.progress(ride, 5)

    expect(ride.driver_id).to eq(5)
    expect(ride.status).to eq("accepted")
  end


end
