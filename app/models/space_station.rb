class SpaceStation < ApplicationRecord
  has_many :astronauts
  validates_presence_of :name, :max_occupants

  # def created_at
  #   require 'pry'; binding.pry
  #   @station
  # end
end
