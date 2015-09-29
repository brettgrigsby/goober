require 'rails_helper'

describe 'sign_up_process', type: :feature do
  include Capybara::DSL

  it 'can create a new rider' do
    visit root_path

    click_link "Rider"

    expect(current_path).to eq(new_rider_path)
    expect(page).to have_content("Rider Sign Up")

    fill_in("name", with: "Brett")
    fill_in("email", with: "test@test.com")
    fill_in("phone_number", with: "1234567890")
    fill_in("password", with: "password")
    fill_in("password_confimation", with: "password")
    click("submit")
  end
end

