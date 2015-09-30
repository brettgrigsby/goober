class ChangeTimeToDatetimeInRides < ActiveRecord::Migration
  def change
    remove_column :rides, :requested_time
    add_column :rides, :requested_time, :timestamp
    remove_column :rides, :accepted_time
    add_column :rides, :accepted_time, :timestamp
    remove_column :rides, :pickup_time
    add_column :rides, :pickup_time, :timestamp
    remove_column :rides, :dropoff_time
    add_column :rides, :dropoff_time, :timestamp
  end
end
