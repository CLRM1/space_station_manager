class SpaceStationAstronautController < ApplicationController
  def index
    # require 'pry'; binding.pry
    @stations = SpaceStation.find(params[:station_id])
    @astronauts = @stations.astronauts
  end
end
