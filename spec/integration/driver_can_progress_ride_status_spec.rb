require 'rails_helper'

describe 'driver progresses ride status', type: :feature do
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

    ride = Ride.create(pickup: "somewhere", dropoff: "somewhere else", passenger_number: 2, rider_id: rider.id, driver_id: driver.id, status: "accepted")
    visit root_path

    click_link "Log In"

    expect(current_path).to eq(login_path)

    fill_in("Email", with: "test@test.com")
    fill_in("Password", with: "password")

    click_button("Log In")
  end

  it "can move from accepted to picked up" do
    expect(page).to have_content("Current Ride")

    click_link("mark as 'picked up'")

    expect(page).to have_content("Current Ride")
    expect(page).to have_link("mark as 'completed'")
  end
end
