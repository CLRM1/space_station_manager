class AddSpaceStationsToAstronauts < ActiveRecord::Migration[5.2]
  def change
    add_reference :astronauts, :space_station, foreign_key: true
  end
end
