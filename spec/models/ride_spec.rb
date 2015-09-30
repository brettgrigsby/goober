require 'rails_helper'

RSpec.describe Ride, type: :model do
  it "is valid" do
    ride = Ride.new(pickup: "some address", dropoff: "another address", passenger_number: 3, rider_id: 1)

    expect(ride).to be_valid
  end

  it "is invalid without a pickup location" do
    ride = Ride.new(pickup: nil, dropoff: "another address", passenger_number: 3, rider_id: 1)

    expect(ride).not_to be_valid
  end

  it "is invalid without a dropoff location" do
    ride = Ride.new(pickup: "some address", dropoff: nil, passenger_number: 3, rider_id: 1)

    expect(ride).not_to be_valid
  end

  it "is invalid without a passenger number" do
    ride = Ride.new(pickup: "some address", dropoff: "another address", passenger_number: nil, rider_id: 1)

    expect(ride).not_to be_valid
  end

  it "is invalid without a rider_id" do
    ride = Ride.new(pickup: "some address", dropoff: "another address", passenger_number: 3, rider_id: nil)

    expect(ride).not_to be_valid
  end

  it "has a default value for status" do
    ride = Ride.new(pickup: "some address", dropoff: "another address", passenger_number: 3, rider_id: 1)

    expect(ride.status).to eq("active")
  end

  it "can calculate cost after completion" do
    ride = Ride.new(pickup: "some address", 
                    dropoff: "another address", 
                    passenger_number: 3, 
                    rider_id: 1,
                    driver_id: 2,
                    status: "completed",
                    requested_time: nil,
                    accepted_time: nil,
                    pickup_time: 15.minutes.ago,
                    dropoff_time: DateTime.now)
    
    expect(ride.cost).to eq(10.00)
  end

end
