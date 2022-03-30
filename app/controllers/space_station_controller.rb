class SpaceStationController < ApplicationController
  def index
    @stations = SpaceStation.ordered_sations
  end

  def new
  end

  def create
    station = SpaceStation.create(space_station_params)
    station.save
    redirect_to '/space_stations'
  end

  def edit
    @station = SpaceStation.find(params[:station_id])
  end

  def update
    station = SpaceStation.find(params[:station_id])
    station.update(space_station_params)
    station.save
    redirect_to "/space_stations/#{station.id}"
  end

  def destroy
    station = SpaceStation.find(params[:station_id])
    station.astronauts.destroy_all
    SpaceStation.destroy(params[:station_id])
    redirect_to "/space_stations"
  end

  def show
    @station = SpaceStation.find(params[:id])
  end

  private
  def space_station_params
    params.permit(:name, :habitable, :max_occupants)
  end
end
