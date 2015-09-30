require 'rails_helper'

RSpec.describe RideState, type: :model do

  let(:ride) { Ride.create(pickup: "place", dropoff: "another place", rider_id: 1, passenger_number: 2) } 

  it "progesses an active ride" do
    RideState.progress(ride, 5)

    expect(ride.driver_id).to eq(5)
    expect(ride.status).to eq("accepted")
  end

  it "progresses an accepted ride" do
    ride.update_attributes(status: "accepted")

    RideState.progress(ride, 5)

    expect(ride.status).to eq("picked up")
  end

  it "progresses a picked up ride" do
    ride.update_attributes(status: "picked up")

    RideState.progress(ride, 5)

    expect(ride.status).to eq("completed")
  end

  it "returns correct string for progress link" do
    expect(RideState.progress_link("accepted")).to eq("mark as 'picked up'")
    expect(RideState.progress_link("picked up")).to eq("mark as 'completed'")
  end
end
