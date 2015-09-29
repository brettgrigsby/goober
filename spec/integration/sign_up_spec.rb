require 'rails_helper'

describe 'sign_up_process', type: :feature do
  include Capybara::DSL

  xit 'can create a new rider' do
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
  end
end

