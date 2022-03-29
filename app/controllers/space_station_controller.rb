class SpaceStationController < ApplicationController
  def index
    @stations = SpaceStation.ordered_sations
  end

  def new
  end

  def create
    station = SpaceStation.create(
              name: params[:name],
              habitable: params[:habitable],
              max_occupants: params[:max_occupants]
    )
    station.save
    redirect_to '/space_stations'
  end

  def edit
    @station = SpaceStation.find(params[:station_id])
  end

  def update
    station = SpaceStation.find(params[:station_id])
    station.update({
              name: params[:name],
              habitable: params[:habitable],
              max_occupants: params[:max_occupants]
              })
    station.save
    redirect_to "/space_stations/#{station.id}"
  end

  def show
    @station = SpaceStation.find(params[:id])
  end
end
