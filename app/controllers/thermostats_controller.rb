class ThermostatsController < ApplicationController

  # search for thermostats in 10-mile radius
  def index
    if params[:search].present?
      @thermostats = Thermostat.near(params[:search], 10, :order => :distance)
    else
      @thermostats = Thermostat.all
    end

  # show thermostat detail
  end

  def show
    @thermostat = Thermostat.find(params[:id])
  end

  #initialize new thermostat
  def new
    @thermostat = Thermostat.new
  end

  # create and save new thermostat
  def create
    @thermostat = Thermostat.new(params[:thermostat])
    if @thermostat.save
      redirect_to @thermostat, :notice => "Successfully created thermostat."
    else
      render :action => 'new'
    end
  end

  # show thermostat detail
  def edit
    @thermostat = Thermostat.find(params[:id])
  end

  # save update to thermostat data
  def update
    @thermostat = Thermostat.find(params[:id])
    if @thermostat.update_attributes(params[:thermostat])
      redirect_to @thermostat, :notice  => "Successfully updated thermostat."
    else
      render :action => 'edit'
    end
  end

end
