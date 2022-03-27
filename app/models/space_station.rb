class SpaceStation < ApplicationRecord
  has_many :astronauts
  validates_presence_of :name, :max_occupants

  def ordered_sations
    stations = SpaceStation.all
    ordered = stations.order("created_at desc")
    ordered
  end

  def created_at_string
    @stations = ordered_sations
    # require 'pry'; binding.pry
    string_array = @stations.map {|station| station.created_at.to_s}
    new_format = ". Created at: #{string_array[0]}"
    # require 'pry'; binding.pry
  end


  # def astronaut_count
  #   @stations = SpaceStation.all
  #   @astronaut_count = 0
  #   @stations.find {|station|
  #     Astronaut.all.each {|astronaut|
  #       station.id == astronaut.space_station_id
  #       @astronaut_count = station.astronauts.count}}
  #   @astronaut_count
  # end
end
