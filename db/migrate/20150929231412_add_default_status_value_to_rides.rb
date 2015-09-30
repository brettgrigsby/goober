class AddDefaultStatusValueToRides < ActiveRecord::Migration
  def change
    change_column :rides, :status, :string, default: "active"
  end
end
