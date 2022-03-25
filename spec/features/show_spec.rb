require 'rails_helper'

RSpec.describe 'space_station show page', type: :feature do
  before(:each) do
    @station = SpaceStation.create!(name: 'ISS', habitable: true, max_occupants: 7)
    @station_2 = SpaceStation.create!(name: 'ESA', habitable: false, max_occupants: 4)
    @walker = Astronaut.create!(name: 'Shanon Walker', active: true, years_active: 10, space_station_id: @station.id)
    @kelly = Astronaut.create!(name: 'Scott Kelly', active: false, years_active: 7, space_station_id: @station.id)
  end

  it 'displays the names of each space_station' do
    visit "/space_stations"
    expect(page).to have_content(@station.name)
    expect(page).to have_content(@station_2.name)
  end

  it 'displays the attributes of a specific space station' do
    visit "/space_stations/#{@station.id}"
    expect(page).to have_content(@station.name)
    expect(page).to have_content(@station.habitable)
    expect(page).to have_content(@station.max_occupants)
  end

  # [ ] done
  #
  # User Story 3, Child Index
  #
  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes:
  it 'displays each astronaut in the system including the astronauts attributes' do
    visit "/astronauts"
    expect(page).to have_content(@walker.name)
  end
end
