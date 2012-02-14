require 'test_helper'

class ThermostatsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Thermostat.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Thermostat.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Thermostat.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to thermostat_url(assigns(:thermostat))
  end

  def test_edit
    get :edit, :id => Thermostat.first
    assert_template 'edit'
  end

  def test_update_invalid
    Thermostat.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Thermostat.first
    assert_template 'edit'
  end

  def test_update_valid
    Thermostat.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Thermostat.first
    assert_redirected_to thermostat_url(assigns(:thermostat))
  end

  def test_destroy
    thermostat = Thermostat.first
    delete :destroy, :id => thermostat
    assert_redirected_to thermostats_url
    assert !Thermostat.exists?(thermostat.id)
  end
end
