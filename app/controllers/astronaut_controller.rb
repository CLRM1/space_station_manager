class AstronautController < ApplicationController
  def index
    @astronauts = Astronaut.all
  end

  def show
    @astronaut = Astronaut.find(params[:id])
  end

  def create
    station = SpaceStation.find(params[:station_id])
    astronaut = Astronaut.create!(
                name: params[:name],
                active: params[:active],
                years_active: params[:years_active],
                space_station_id: params[:station_id]
    )
    astronaut.save
    redirect_to "/space_stations/#{station.id}/astronauts"
  end
end
