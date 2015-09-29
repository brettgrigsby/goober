require 'rails_helper'

describe 'sign_up_process', type: :feature do
  include Capybara::DSL

  it 'can create a new rider' do
    visit root_path

    click_link "Rider"

    expect(current_path).to eq(new_rider_path)
    expect(page).to have_content("Rider Sign Up")

    fill_in("Name", with: "Brett")
    fill_in("Email", with: "test@test.com")
    fill_in("Phone number", with: "1234567890")
    fill_in("Password", with: "password")
    fill_in("Password confirmation", with: "password")

    click_button("create account")

    created_user = User.last

    expect(page).to have_content("Brett")
    expect(current_path).to eq(rider_path(created_user))
  end

  it "can create a new driver" do
    visit root_path
    click_link "Driver"

    expect(current_path).to eq(new_driver_path)
    expect(page).to have_content("Driver Sign Up")

    fill_in("Name", with: "Brett")
    fill_in("Email", with: "test@test.com")
    fill_in("Phone number", with: "1234567890")
    fill_in("Password", with: "password")
    fill_in("Password confirmation", with: "password")
    fill_in("Car make", with: "Testla")
    fill_in("Car model", with: "Nodester")
    fill_in("Passenger cap", with: "3")

    click_button("create account")

    expect(page).to have_content("Brett")
  end
end

