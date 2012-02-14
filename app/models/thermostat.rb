class Thermostat < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :serial_number, :set_point
  geocoded_by :address
	after_validation :geocode, :if => :address_changed?
end
