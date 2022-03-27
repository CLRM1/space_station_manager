class Astronaut < ApplicationRecord
  belongs_to :space_station
  validates_presence_of :name
  validates_presence_of :years_active
end
