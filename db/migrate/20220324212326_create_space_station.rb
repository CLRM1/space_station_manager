class CreateSpaceStation < ActiveRecord::Migration[5.2]
  def change
    create_table :space_stations do |t|
      t.string :name
      t.boolean :habitable
      t.integer :max_occupants

      t.timestamps
    end
  end
end
