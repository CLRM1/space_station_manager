class CreateSpaceStations < ActiveRecord::Migration[5.2]
  def change
    create_table :space_stations do |t|
      t.string :name
      t.boolean :habitable
      t.bigint :max_occupants
    end
  end
end
