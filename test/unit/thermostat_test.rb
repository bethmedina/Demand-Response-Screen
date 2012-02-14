require 'test_helper'

class ThermostatTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Thermostat.new.valid?
  end
end
