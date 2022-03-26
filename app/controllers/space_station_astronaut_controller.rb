class SpaceStationAstronautController < ApplicationController
  def index
    @stations = SpaceStation.find(params[:station_id])
    @astronauts = @stations.astronauts
  end
end
