class SpaceStation < ApplicationRecord
  has_many :astronauts
  validates_presence_of :name
  validates_presence_of :max_occupants
end
