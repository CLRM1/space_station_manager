class SpaceStation < ApplicationRecord
  has_many :astronauts
  validates_presence_of :name, :max_occupants

  # def ordered_sations
  #   stations = SpaceStation.all
  #   ordered = stations.order("created_at desc")
  #   @stations = ordered
  # end
  #
  # def created_at_string
  #   @stations = ordered_sations
  #   string_array = @stations.map {|station| station.created_at.to_s}
  #   new_format = ". Created at: #{string_array[0]}"
  #   string_array = []
  #   stations = SpaceStation.pluck(:created_at)
  #   ordered = stations.order("created_at desc")
  #   ordered.each {|date| string_array << date}
  # end
end
