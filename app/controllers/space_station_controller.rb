class SpaceStationController < ApplicationController
  def index
    @stations = SpaceStation.all
  end

  def show
    @station = SpaceStation.find(params[:id])
  end
  
end
