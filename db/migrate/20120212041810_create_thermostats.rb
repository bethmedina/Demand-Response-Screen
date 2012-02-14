class CreateThermostats < ActiveRecord::Migration
  def self.up
    create_table :thermostats do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :serial_number
      t.integer :set_point
      t.timestamps
    end
  end

  def self.down
    drop_table :thermostats
  end
end
