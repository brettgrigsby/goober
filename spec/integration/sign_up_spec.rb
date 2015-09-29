require 'rails_helper'

describe 'sign_up_process', type: :feature do
  include Capybara::DSL

  it 'can create a new rider' do
    visit root_path

    click_link "Rider"

    expect(current_path).to eq(new_rider_path)
  end
end

