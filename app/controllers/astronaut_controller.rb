class AstronautController < ApplicationController
  def index
    # @astronauts = Astronaut.all
    @astronauts = Astronaut.active_astronauts
    # require 'pry'; binding.pry
  end

  def show
    @astronaut = Astronaut.find(params[:id])
  end
# move to new controller?
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

  def edit
    @astronaut = Astronaut.find(params[:id])
  end

  def update
    astronaut = Astronaut.find(params[:astronaut_id])
    station_id = astronaut.space_station.id
    astronaut.update({
              name: params[:name],
              active: params[:active],
              years_active: params[:years_active],
              id: params[:astronaut_id],
              space_station_id: station_id
              })
    astronaut.save
    redirect_to "/astronauts/#{astronaut.id}"
  end
end
