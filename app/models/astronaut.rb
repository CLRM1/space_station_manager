class Astronaut < ApplicationRecord
  belongs_to :space_station
  validates_presence_of :name
  validates_presence_of :years_active

  def self.active_astronauts
    where(active: 'true')
  end

  def self.sorted_astronauts
    order(:name)
  end

  # def self.delete_astronauts
  #   space_station.astronauts.destroy_all
  # end
end
