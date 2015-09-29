require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid" do
    user = User.new(name: "Brett", email: "test@test.com", phone_number: "1234567890", password: "password")

    expect(user).to be_valid
  end

  it "is invalid without name" do
    user = User.new(name: nil, email: "test@test.com", phone_number: "1234567890", password: "password")

    expect(user).not_to be_valid
  end

  it "is invalid without phone number" do
    user = User.new(name: "Brett", email: "test@test.com", phone_number: nil, password: "password")

    expect(user).not_to be_valid
  end

  it "is invalid without password" do
    user = User.new(name: "Brett", email: "test@test.com", phone_number: "1234567890", password: nil)

    expect(user).not_to be_valid
  end
end
