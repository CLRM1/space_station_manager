require 'rails_helper'

RSpec.describe 'space_station show page', type: :feature do

#   [ ] done
#
# User Story 1, Parent Index
#
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

  it 'displays the names of each space_station' do
    station = SpaceStation.create!(name: 'ISS', habitable: true, max_occupants: 7)
    visit "/space_stations/#{station.id}"
    save_and_open
    expect(page).to have_content(station.name)
    # expect(page).to_not have_content(station_2.name)
  end
end
