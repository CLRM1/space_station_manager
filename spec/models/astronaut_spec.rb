require 'rails_helper'

RSpec.describe Astronaut, type: :model do
  describe 'relationships' do
    it { should belong_to :space_station }
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :years_active}
    it { should allow_value(true).for(:active) }
    it { should allow_value(false).for(:active) }
  end

  describe 'class methods' do
    before(:each) do
      @station = SpaceStation.create(name: 'Japanese Space Station', habitable: true, max_occupants: 10)
      @astronaut_1 = Astronaut.create!(name: 'Kalpana Chawla', active: true, years_active: 5,  space_station_id: @station.id)
      @astronaut_2 = Astronaut.create!(name: 'Jessica Meir', active: true, years_active: 5,  space_station_id: @station.id)
      @astronaut_3 = Astronaut.create!(name: 'Peggy Whitson', active: false, years_active: 5,  space_station_id: @station.id)
    end

    it 'sorts the astronauts alphabetically' do
      expect(Astronaut.sorted_astronauts).to eq([@astronaut_2, @astronaut_1, @astronaut_3])
    end

    it 'only displays astronauts that have true for the active attribute' do
      expect(Astronaut.active_astronauts).to eq([@astronaut_1, @astronaut_2])
    end
  end
end
