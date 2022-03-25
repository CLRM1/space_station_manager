class AstronautController < ApplicationController
  def index
    @astronauts = Astronaut.all
  end

end
