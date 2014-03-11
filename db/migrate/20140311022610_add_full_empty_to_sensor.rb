class AddFullEmptyToSensor < ActiveRecord::Migration
  def change
    add_column :sensors, :full, :integer
    add_column :sensors, :empty, :integer
  end
end
