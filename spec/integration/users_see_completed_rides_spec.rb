require 'rails_helper'

describe 'users diplay completed rides', type: :feature do
  include Capybara::DSL

  before(:each) do
    rider = User.create(name: "Doug",
                       email: "best@test.com",
                       phone_number: "1234567890",
                       password: "password",
                       role: "rider")
    driver = User.create(name: "Brett",
                       email: "test@test.com",
                       phone_number: "1234567890",
                       password: "password",
                       role: "driver",
                       car_make: "Testla",
                       car_model: "Nodester",
                       passenger_cap: 3)

    ride = Ride.create(pickup: "somewhere", 
                       dropoff: "somewhere else", 
                       passenger_number: 2, 
                       rider_id: rider.id, 
                       driver_id: driver.id, 
                       status: "completed",
                       requested_time: DateTime.now,
                       accepted_time: DateTime.now,
                       pickup_time: DateTime.now,
                       dropoff_time: DateTime.now)

    ryde = Ride.create(pickup: "another ride", 
                       dropoff: "somewhere else", 
                       passenger_number: 2, 
                       rider_id: rider.id, 
                       driver_id: driver.id, 
                       status: "completed",
                       requested_time: DateTime.now,
                       accepted_time: DateTime.now,
                       pickup_time: DateTime.now,
                       dropoff_time: DateTime.now)
  end

  it "driver sees completed rides" do

    visit root_path

    click_link "Log In"

    expect(current_path).to eq(login_path)

    fill_in("Email", with: "test@test.com")
    fill_in("Password", with: "password")

    click_button("Log In")
    expect(page).to have_content("Completed Rides")
    expect(page).to have_content("Doug")
    expect(page).to have_content("somewhere")
    expect(page).to have_content("another ride")
  end

  it "rider sees completed rides" do

    visit root_path

    click_link "Log In"

    expect(current_path).to eq(login_path)

    fill_in("Email", with: "best@test.com")
    fill_in("Password", with: "password")

    click_button("Log In")
    expect(page).to have_content("Completed Rides")
    expect(page).to have_content("Brett")
    expect(page).to have_content("somewhere")
    expect(page).to have_content("another ride")
  end
end
