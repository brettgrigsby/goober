class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :name, :phone_number
  validates :email, presence: true, uniqueness: true
end
