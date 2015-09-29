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

  it "is invalid without email" do
    user = User.new(name: "Brett", email: nil, phone_number: "1234567890", password: "password")
    
    expect(user).not_to be_valid
  end

  it "must have a unique email" do
    user1 = User.create(name: "Brett", email: "test@test.com", phone_number: "1234567890", password: "password")
    user2 = user = User.new(name: "Judge", email: "test@test.com", phone_number: "1234567891", password: "password2")

    expect(user2).not_to be_valid
  end

  it "must have a car_make, car_model, and passenger_cap if their role is 'driver'" do
    user = User.new(name: "Brett", 
                    email: "test@test.com", 
                    phone_number: "1234567890", 
                    password: "password", 
                    role: "driver", 
                    car_make: "Testla", 
                    car_model: "Nodester", 
                    passenger_cap: 3)
    expect(user).to be_valid
    
    user.car_make = nil
    expect(user).not_to be_valid

    user.car_make = "Testla"
    user.car_model = nil
    expect(user).not_to be_valid

    user.car_model = "Nodester"
    user.passenger_cap = nil
    expect(user).not_to be_valid

    user.passenger_cap = 3
    expect(user).to be_valid
  end
end
