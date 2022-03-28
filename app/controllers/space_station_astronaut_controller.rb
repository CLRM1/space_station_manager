class SpaceStationAstronautController < ApplicationController
  def index
    @station = SpaceStation.find(params[:station_id])
    @astronauts = @station.astronauts
  end

  def new
    @station = SpaceStation.find(params[:station_id])
  end
end
