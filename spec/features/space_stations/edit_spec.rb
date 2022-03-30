require 'rails_helper'

RSpec.describe 'space_station show page', type: :feature do
  before(:each) do
    @station = SpaceStation.create!(name: 'ISS', habitable: true, max_occupants: 7)
    @station_2 = SpaceStation.create!(name: 'ESA', habitable: false, max_occupants: 4)
    @walker = Astronaut.create!(name: 'Shanon Walker', active: true, years_active: 10, space_station_id: @station.id)
    @kelly = Astronaut.create!(name: 'Scott Kelly', active: false, years_active: 7, space_station_id: @station.id)
    @armstrong = Astronaut.create!(name: 'Neil Armstrong', active: false, years_active: 10, space_station_id: @station_2.id)
  end

  it 'displays a link to update the space station on a space station show page' do
    visit "/space_stations/#{@station.id}"
    expect(page). to have_link('Update')
    click_link 'Update'
    expect(current_path).to eq("/space_stations/#{@station.id}/edit")

    fill_in 'name', with: 'Japanese Space Station'
    fill_in 'habitable', with: false
    fill_in 'max_occupants', with: 30
    click_on 'Save'

    expect(current_path).to eq("/space_stations/#{@station.id}")
    expect(page).to have_content('Japanese Space Station')
  end
end
