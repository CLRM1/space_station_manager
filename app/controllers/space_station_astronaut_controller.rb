class SpaceStationAstronautController < ApplicationController
  def index
    @station = SpaceStation.find(params[:station_id])
    if params[:sort] == 'sorted_astronauts'
      @astronauts = @station.astronauts.sorted_astronauts
    elsif params[:years_active_min]
      @astronauts = @station.astronauts.where("years_active > #{params[:years_active_min]}")
    else
      @astronauts = @station.astronauts
    end
  end

  def new
    @station = SpaceStation.find(params[:station_id])
  end
end
