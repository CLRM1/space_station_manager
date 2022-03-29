class SpaceStationAstronautController < ApplicationController
  def index
    @station = SpaceStation.find(params[:station_id])
    if params[:sort] == 'sorted_astronauts'
      @astronauts = @station.astronauts.sorted_astronauts
    else
      @astronauts = @station.astronauts
    end
    # @astronauts = @station.astronauts
  end

  def new
    @station = SpaceStation.find(params[:station_id])
  end
end
