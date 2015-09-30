require 'rails_helper'

describe 'driver selects ride', type: :feature do
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

    ride = Ride.create(pickup: "somewhere", dropoff: "somewhere else", passenger_number: 2, rider_id: rider.id)
    new_ride = Ride.create(pickup: "Nope", dropoff: "you shouldn't see this", passenger_number: 4, rider_id: rider.id)
    visit root_path

    click_link "Log In"

    expect(current_path).to eq(login_path)

    fill_in("Email", with: "test@test.com")
    fill_in("Password", with: "password")

    click_button("Log In")
  end

  it 'sees a list of all active rides' do
    expect(page).to have_content("somewhere else")
  end

  it "doesn't see rides over its passenger cap" do
    expect(page).not_to have_content("you shouldn't see this")
  end

  it "selects an available ride" do
    user = User.find_by(email: "test@test.com")

    click_link("Accept Ride")

    expect(current_path).to eq(driver_path(user))
    expect(page).to have_content("Current Ride")
    expect(page).to have_content("somewhere")
  end
end

