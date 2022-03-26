class SpaceStation < ApplicationRecord
  has_many :astronauts
  validates_presence_of :name, :max_occupants

  def created_at_string
    @stations = SpaceStation.all
    string_array = @stations.map {|station| station.created_at.to_s}
    new_format = ". Created at: #{string_array[0]}"
  end

  def astronaut_count
    @stations = SpaceStation.all
    @astronaut_count = 0
    @stations.find {|station|
      Astronaut.all.each {|astronaut|
        station.id == astronaut.space_station_id
        @astronaut_count = station.astronauts.count}}
    @astronaut_count
  end
end
