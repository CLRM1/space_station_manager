class SpaceStationController < ApplicationController
  def index
    @stations = SpaceStation.all.order("created_at desc")
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

  def show
    @station = SpaceStation.find(params[:id])
  end
end
