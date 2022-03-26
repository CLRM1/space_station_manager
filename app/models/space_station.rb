class SpaceStation < ApplicationRecord
  has_many :astronauts
  validates_presence_of :name, :max_occupants

  def created_at_string
    @stations = SpaceStation.all
    string_array = @stations.map {|station| station.created_at.to_s}
    new_format = ". Created at: #{string_array[0]}"
  end
end
