class AstronautController < ApplicationController
  def index
    @astronauts = Astronaut.active_astronauts
  end

  def show
    @astronaut = Astronaut.find(params[:id])
  end
# move to new controller?
  def create
    # require 'pry'; binding.pry
    station = SpaceStation.find(params[:station_id])
    astronaut = station.astronauts.create!(astronaut_params)
    # astronaut = Astronaut.create!(astronaut_params)
    #             name: params[:name],
    #             active: params[:active],
    #             years_active: params[:years_active],
    #             space_station_id: params[:station_id]
    # )
    astronaut.save
    redirect_to "/space_stations/#{station.id}/astronauts"
  end

  def edit
    @astronaut = Astronaut.find(params[:id])
  end

  def update
    astronaut = Astronaut.find(params[:astronaut_id])
    station_id = astronaut.space_station.id
    astronaut.update(astronaut_params)
    astronaut.save
    redirect_to "/astronauts/#{astronaut.id}"
  end

  def destroy
    Astronaut.destroy(params[:astronaut_id])
    redirect_to "/astronauts"
  end

  private
# use for create, update, anywhere where you're pulling a bunch of params
  def astronaut_params
    params.permit(:name, :active, :years_active)
  end
end
