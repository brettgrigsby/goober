class AddUserIdsToRides < ActiveRecord::Migration
  def change
    add_column :rides, :driver_id, :integer, index: true
    add_column :rides, :rider_id, :integer, index: true
  end
end
