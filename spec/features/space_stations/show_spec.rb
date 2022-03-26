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
    expect(page).to have_content("Number of astronauts: 2")
    visit "/space_stations/#{@station_2.id}"
    expect(page).to have_content(@station_2.astronaut_count)
    expect(page).to have_content("Number of astronauts: 1")
  end

#   [ ] done
#
# User Story 8, Child Index Link
#
# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Child Index
  # xit 'displays a link at the top of the page that takes me to the astronauts index' do
  #   visit "/astronauts/"
  # end
end
