require 'rails_helper'

describe 'rider requests ride', type: :feature do
  include Capybara::DSL

  before(:each) do
    user = User.create(name: "Brett",
                       email: "test@test.com",
                       phone_number: "1234567890",
                       password: "password",
                       role: "rider")

    visit root_path

    click_link "Log In"

    expect(current_path).to eq(login_path)

    fill_in("Email", with: "test@test.com")
    fill_in("Password", with: "password")

    click_button("Log In")
  end

  it 'sees a link to request ride on show page' do
    expect(page).to have_link("request a ride")
  end

  it 'can request a ride by entering correct info' do
    click_link("request a ride")

    expect(current_path).to eq(new_ride_path)

    fill_in("Pickup location", with: "some address")
    fill_in("Dropoff location", with: "another address")
    fill_in("Number of passengers", with: "3")
    click_button("Request Ride")

    user = User.last
    expect(current_path).to eq(rider_path(user))
    expect(page).to have_content("some address")
  end
end
