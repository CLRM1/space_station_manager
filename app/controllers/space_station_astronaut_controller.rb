class SpaceStationAstronautController < ApplicationController
  def index
    # require 'pry'; binding.pry
    @station = SpaceStation.find(params[:station_id])
    if params[:sort] == 'sorted_astronauts'
      # require 'pry'; binding.pry
      @astronauts = @station.astronauts.sorted_astronauts
    # elsif params[:years_active_min] >= 0
      # require 'pry'; binding.pry
    else
      @astronauts = @station.astronauts
    end
  end

  def new
    @station = SpaceStation.find(params[:station_id])
  end
end
