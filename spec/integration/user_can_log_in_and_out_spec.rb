require 'rails_helper'

describe 'log_in_and_out_process', type: :feature do
  include Capybara::DSL

  it 'lets a rider log in and out' do
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

    expect(current_path).to eq(rider_path(user))

    click_link("Log Out")

    expect(current_path).to eq(root_path)
  end

  it 'lets a driver log in and out' do
    user = User.create(name: "Brett",
                       email: "test@test.com",
                       phone_number: "1234567890",
                       password: "password",
                       role: "driver",
                       car_make: "Honda",
                       car_model: "Civic",
                       passenger_cap: 4)

    visit root_path

    click_link "Log In"

    expect(current_path).to eq(login_path)

    fill_in("Email", with: "test@test.com")
    fill_in("Password", with: "password")

    click_button("Log In")

    expect(current_path).to eq(driver_path(user))

    click_link("Log Out")

    expect(current_path).to eq(root_path)
  end
end
