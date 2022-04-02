class SpaceStation < ApplicationRecord
  has_many :astronauts, dependent: :destroy
  validates_presence_of :name, :max_occupants

  def self.ordered_sations
    stations = SpaceStation.all
    stations.order("created_at desc")
  end
end
