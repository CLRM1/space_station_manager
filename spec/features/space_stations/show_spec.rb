require 'rails_helper'

RSpec.describe 'space_station show page', type: :feature do
  before(:each) do
    @station = SpaceStation.create!(name: 'ISS', habitable: true, max_occupants: 7)
    @station_2 = SpaceStation.create!(name: 'ESA', habitable: false, max_occupants: 4)
    @walker = Astronaut.create!(name: 'Shanon Walker', active: true, years_active: 10, space_station_id: @station.id)
    @kelly = Astronaut.create!(name: 'Scott Kelly', active: false, years_active: 7, space_station_id: @station.id)
    @armstrong = Astronaut.create!(name: 'Neil Armstrong', active: false, years_active: 10, space_station_id: @station_2.id)
  end

  it 'displays the attributes of a specific space station' do
    visit "/space_stations/#{@station.id}"
    expect(page).to have_content(@station.name)
    expect(page).to have_content(@station.habitable)
    expect(page).to have_content(@station.max_occupants)
  end
  it 'displays the count of astronauts associated with the space station' do
    visit "/space_stations/#{@station.id}"
    expect(page).to have_content(@station.astronaut_count)
    expect(@station.astronaut_count).to eq(2)
    expect(page).to have_content("Number of Astronauts: 2")
  end
end
