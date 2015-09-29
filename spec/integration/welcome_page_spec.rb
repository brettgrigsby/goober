require 'rails_helper'

describe 'welcome_page', type: :feature do
  include Capybara::DSL

  it 'can add ingredients to the pantry' do
    visit root_path

    expect(page).to have_content('GOOBER')
  end
end

