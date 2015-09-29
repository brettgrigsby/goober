class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :pickup
      t.string :dropoff
      t.integer :passenger_number
      t.string :status
      t.time :requested_time
      t.time :accepted_time
      t.time :pickup_time
      t.time :dropoff_time

      t.timestamps null: false
    end
  end
end
