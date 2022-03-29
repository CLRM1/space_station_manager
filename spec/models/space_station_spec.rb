require 'rails_helper'

RSpec.describe SpaceStation, type: :model do
  describe 'relationships' do
    it { should have_many :astronauts }
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :max_occupants}
    it { should allow_value(true).for(:habitable) }
    it { should allow_value(false).for(:habitable) }
  end

  describe 'class methods' do
    before(:each) do
      time_stamp_1 = Time.now
      time_stamp_2 = Time.now - 1.day
      @station = SpaceStation.create(name: 'Japanese Space Station', habitable: true, max_occupants: 10, created_at: time_stamp_1)
      @station_2 = SpaceStation.create(name: 'Chinese Space Station', habitable: true, max_occupants: 10, created_at: time_stamp_2)
    end

    it 'orders the space stations by most recently created' do
      expect(SpaceStation.ordered_sations).to eq([@station, @station_2])
    end
  end
end
