require 'rails_helper'

RSpec.describe 'space_station show page', type: :feature do

#   [x] done
#
# User Story 1, Parent Index
#
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

  it 'displays the names of each space_station' do
    station = SpaceStation.create!(name: 'ISS', habitable: true, max_occupants: 7)
    station_2 = SpaceStation.create!(name: 'ESA', habitable: false, max_occupants: 4)
    visit "/space_stations"
    save_and_open_page
    expect(page).to have_content(station.name)
    expect(page).to have_content(station_2.name)
  end

#   [ ] done
#
# User Story 2, Parent Show
#
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table
  it 'displays the attributes of a specific space station' do
    station = SpaceStation.create!(name: 'ISS', habitable: true, max_occupants: 7)
    station_2 = SpaceStation.create!(name: 'ESA', habitable: false, max_occupants: 4)
    visit "/space_stations/#{station.id}"
    save_and_open_page
    expect(page).to have_content(station.name)
    expect(page).to have_content(station.habitable)
    expect(page).to have_content(station.max_occupants)
  end
end
