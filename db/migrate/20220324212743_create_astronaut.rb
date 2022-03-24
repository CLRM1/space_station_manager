class CreateAstronaut < ActiveRecord::Migration[5.2]
  def change
    create_table :astronauts do |t|
      t.integer :station_id
      t.string :name
      t.boolean :active
      t.integer :years_active

      t.timestamps
    end
  end
end
